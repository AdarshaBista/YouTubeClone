import 'package:youtube_clone/core/models/post.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

class PostsService {
  final List<Post> posts = [];

  int id = 0;

  Future<void> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> createPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    final validPost = post.copyWith(
      id: id.toString(),
      user: FakeData.user,
      dateUpdated: DateTime.now(),
    );
    posts.add(validPost);
    id++;
  }

  Future<void> updatePost(Post updatedPost) async {
    await Future.delayed(const Duration(seconds: 1));
    final oldPostIndex = posts.indexWhere((p) => p.id == updatedPost.id);
    posts.removeAt(oldPostIndex);
    posts.insert(oldPostIndex, updatedPost);
  }

  void deletePost(Post post) {
    posts.remove(post);
  }
}
