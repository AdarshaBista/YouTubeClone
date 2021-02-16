import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/post.dart';
import 'package:youtube_clone/core/services/posts_service.dart';
import 'package:youtube_clone/core/services/image_picker_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/posts_cubit/posts_cubit.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/post_form.dart';

class _Options {
  static const String edit = 'Edit';
  static const String delete = 'Delete';
}

class PostOptions extends StatelessWidget {
  final Post post;

  const PostOptions({
    @required this.post,
  }) : assert(post != null);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (selected) => _handleOption(context, selected),
      child: const Icon(
        Icons.more_vert_outlined,
        size: 20.0,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: _Options.edit,
            child: Text(_Options.edit, style: context.t.headline5),
          ),
          PopupMenuItem(
            value: _Options.delete,
            child: Text(_Options.delete, style: context.t.headline5),
          ),
        ];
      },
    );
  }

  void _handleOption(BuildContext context, String selected) {
    if (selected == _Options.edit) {
      _showUpdatePostForm(context);
    } else if (selected == _Options.delete) {
      context.read<PostsCubit>().deletePost(post);
    }
  }

  void _showUpdatePostForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (_) => PostFormCubit(
            post: post,
            postsService: context.read<PostsService>(),
            imagePickerService: context.read<ImagePickerService>(),
          ),
          child: PostForm(isEditMode: true),
        );
      },
    );
  }
}
