import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/core/models/post.dart';
import 'package:youtube_clone/core/services/storage_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostsService {
  static const collection = 'posts';

  final storageService = StorageService(collection);
  final postsCollection = FirebaseFirestore.instance.collection(collection);

  Stream<List<Post>> watchPosts() {
    return postsCollection.snapshots().map((snapshot) {
      final posts = snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
      posts.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
      return posts;
    });
  }

  Future<void> createPost(Post post) async {
    final uploadedImageUrls = await storageService.uploadImages(post.imageUrls);
    final newPost = post.copyWith(
      user: FakeData.user,
      updatedAt: DateTime.now(),
      imageUrls: uploadedImageUrls,
    );

    await postsCollection.add(newPost.toMap());
  }

  Future<void> updatePost(Post post, List<String> deletedImageUrls) async {
    final oldImageUrls = post.imageUrls.where((url) => url.startsWith('http'));
    final newImageUrls = post.imageUrls.where((url) => !url.startsWith('http'));

    final uploadedImageUrls =
        await storageService.uploadImages(newImageUrls.toList());
    await storageService.deleteImages(deletedImageUrls);

    final updatedPost = post.copyWith(
      updatedAt: DateTime.now(),
      imageUrls: [...oldImageUrls, ...uploadedImageUrls],
    );
    await postsCollection.doc(post.id).update(updatedPost.toMap());
  }

  Future<void> deletePost(Post post) async {
    await postsCollection.doc(post.id).delete();
    await storageService.deleteImages(post.imageUrls);
  }
}
