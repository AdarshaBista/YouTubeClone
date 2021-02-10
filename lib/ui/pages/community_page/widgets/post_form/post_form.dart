import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/posts_cubit/posts_cubit.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/user_avatar.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/images_list.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/form_text_field.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/add_image_options.dart';

class PostForm extends StatelessWidget {
  final bool isEditMode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PostForm({
    this.isEditMode = false,
  }) : assert(isEditMode != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 8.0),
            _buildUserInfo(context),
            const Expanded(child: FormTextField()),
            const SizedBox(height: 8.0),
            const ImagesList(),
            const Divider(),
            const AddImageOptions(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        'Create Post',
        style: context.t.headline4,
      ),
      actions: [_buildPostButton(context)],
    );
  }

  Widget _buildPostButton(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsLoading) {
          return const FittedBox(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        return TextButton(
          onPressed: () => _createPost(context),
          child: Text(
            isEditMode ? 'UPDATE' : 'POST',
            style: context.t.headline5.bold,
          ),
        );
      },
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return ListTile(
      leading: const UserAvatar(username: 'Abc'),
      title: Text(
        'Name',
        style: context.t.headline4,
      ),
    );
  }

  Future<void> _createPost(BuildContext context) async {
    if (!_formKey.currentState.validate()) return;
    final post = context.read<PostFormCubit>().state;
    final deletedImageUrls = context.read<PostFormCubit>().deletedImageUrls;

    if (isEditMode) {
      await context.read<PostsCubit>().updatePost(post, deletedImageUrls);
    } else {
      await context.read<PostsCubit>().createPost(post);
    }

    Navigator.of(context).pop();
  }
}
