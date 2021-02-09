import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:youtube_clone/core/models/post.dart';
import 'package:youtube_clone/core/services/posts_service.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsService postsService;

  PostsCubit({
    @required this.postsService,
  })  : assert(postsService != null),
        super(const PostsEmpty());

  Future<void> fetchPosts() async {
    emit(const PostsLoading());
    try {
      await postsService.fetchPosts();
      if (postsService.posts.isEmpty) {
        emit(const PostsEmpty());
      } else {
        emit(PostsLoaded(posts: postsService.posts));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(const PostsError(message: 'Something went wrong!'));
    }
  }

  Future<void> createPost(Post post) async {
    emit(const PostsLoading());
    await postsService.createPost(post);
    emit(PostsLoaded(posts: postsService.posts));
  }

  Future<void> updatePost(Post post) async {
    emit(const PostsLoading());
    await postsService.updatePost(post);
    emit(PostsLoaded(posts: postsService.posts));
  }

  void deletePost(Post post) {
    postsService.deletePost(post);
    if (postsService.posts.isEmpty) {
      emit(const PostsEmpty());
    } else {
      emit(PostsLoaded(posts: postsService.posts));
    }
  }
}
