import 'package:flutter/material.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/ui/widgets/appbar/persistent_appbar.dart';
import 'package:youtube_clone/ui/pages/community_page/widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage();

  @override
  Widget build(BuildContext context) {
    final posts = FakeData.posts;

    return CustomScrollView(
      slivers: [
        const PersistentAppbar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => PostCard(post: posts[index]),
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}
