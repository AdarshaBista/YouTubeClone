import 'package:flutter/material.dart';

import 'package:youtube_clone/core/services/posts_service.dart';
import 'package:youtube_clone/core/services/image_picker_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/user_avatar.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/post_form.dart';

class CreatePostPrompt extends StatelessWidget {
  const CreatePostPrompt();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatar(username: 'Abc'),
          const SizedBox(width: 12.0),
          Expanded(child: _buildTextContainer(context)),
        ],
      ),
    );
  }

  Widget _buildTextContainer(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCreatePostForm(context),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: context.c.surface,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.lightbulb_outlined,
              color: AppColors.primary,
            ),
            const SizedBox(width: 12.0),
            Text(
              "What's on your mind?",
              style: context.t.headline5,
            ),
          ],
        ),
      ),
    );
  }

  void _showCreatePostForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (_) => PostFormCubit(
            postsService: context.read<PostsService>(),
            imagePickerService: context.read<ImagePickerService>(),
          ),
          child: PostForm(),
        );
      },
    );
  }
}
