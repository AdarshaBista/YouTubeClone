import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/user_avatar.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/form_text_field.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/add_image_button.dart';

class PostForm extends StatelessWidget {
  const PostForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Column(
        children: [
          const Divider(),
          const SizedBox(height: 8.0),
          _buildUserInfo(context),
          const Expanded(child: FormTextField()),
          const Divider(),
          const AddImageButton(),
        ],
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        'Create Post',
        style: context.t.headline4,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'POST',
            style: context.t.headline5.bold,
          ),
        ),
      ],
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
}
