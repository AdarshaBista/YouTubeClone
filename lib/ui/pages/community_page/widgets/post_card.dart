import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/post.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/user_avatar.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/images_grid.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_options.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    @required this.post,
  }) : assert(post != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          const SizedBox(height: 10.0),
          _buildUserInfo(context),
          const SizedBox(height: 10.0),
          Text(post.text, style: context.t.headline5),
          if (post.imageUrls.isNotEmpty) ...[
            const SizedBox(height: 10.0),
            ImagesGrid(imageUrls: post.imageUrls),
          ],
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          username: post.user.name,
          imageUrl: post.user.avatarUrl,
        ),
        const SizedBox(width: 12.0),
        _buildUserName(context),
        const Spacer(),
        PostOptions(post: post),
      ],
    );
  }

  Widget _buildUserName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.user.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.t.headline5.bold,
        ),
        const SizedBox(height: 4.0),
        Text(
          post.timeAgo,
          style: context.t.headline6,
        ),
      ],
    );
  }
}
