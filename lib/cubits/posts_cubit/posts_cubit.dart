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

  Future<void> watchPosts() async {
    emit(const PostsLoading());
    try {
      postsService.watchPosts().listen((posts) {
        if (posts.isEmpty) {
          emit(const PostsEmpty());
        } else {
          emit(PostsLoaded(posts: posts));
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(const PostsError(message: 'Something went wrong!'));
    }
  }

  Future<void> createPost(Post post) async {
    emit(const PostsLoading());
    await postsService.createPost(post);
  }

  Future<void> updatePost(Post post, List<String> deletedImageUrls) async {
    emit(const PostsLoading());
    await postsService.updatePost(post, deletedImageUrls);
  }

  Future<void> deletePost(Post post) async {
    await postsService.deletePost(post);
  }
}
