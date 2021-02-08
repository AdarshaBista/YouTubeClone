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
      final posts = await postsService.fetchPosts();
      if (posts.isNotEmpty) {
        emit(PostsLoaded(posts: posts));
      } else {
        emit(const PostsEmpty());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(const PostsError(message: 'Something went wrong!'));
    }
  }
}
