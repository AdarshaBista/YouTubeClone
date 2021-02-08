import 'package:youtube_clone/core/models/post.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

class PostsService {
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 3));
    return FakeData.posts;
  }

  Future<String> createPost(Post post) async {
    return '';
  }

  Future<void> updatePost(Post post) async {}

  Future<void> deletePost(Post post) async {}
}
