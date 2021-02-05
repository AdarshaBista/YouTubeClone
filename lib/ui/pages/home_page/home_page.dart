import 'package:flutter/material.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/ui/widgets/appbar/persistent_appbar.dart';
import 'package:youtube_clone/ui/pages/home_page/widgets/video_card.dart';
import 'package:youtube_clone/ui/pages/home_page/widgets/suggestion_chips.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final videos = FakeData.videos;

    return CustomScrollView(
      slivers: [
        const PersistentAppbar(
          bottom: SuggestionChips(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => VideoCard(video: videos[index]),
            childCount: videos.length,
          ),
        ),
      ],
    );
  }
}
