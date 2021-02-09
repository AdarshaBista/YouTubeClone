import 'package:youtube_clone/core/models/post.dart';

class PostsService {
  int id = 0;
  final List<Post> posts = [];

  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 3));
    return posts;
  }

  Future<String> createPost(Post post) async {
    id++;
    return id.toString();
  }

  Future<void> updatePost(Post post) async {}

  Future<void> deletePost(Post post) async {}
}
