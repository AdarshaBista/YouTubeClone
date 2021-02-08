part of 'posts_cubit.dart';

@immutable
abstract class PostsState {
  const PostsState();
}

class PostsEmpty extends PostsState {
  final String message;

  const PostsEmpty({
    this.message = 'No posts to show!',
  }) : assert(message != null);
}

class PostsLoading extends PostsState {
  const PostsLoading();
}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  const PostsLoaded({
    @required this.posts,
  }) : assert(posts != null);
}

class PostsError extends PostsState {
  final String message;

  const PostsError({
    @required this.message,
  }) : assert(message != null);
}
