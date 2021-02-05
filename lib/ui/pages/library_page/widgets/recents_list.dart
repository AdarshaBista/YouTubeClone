import 'package:flutter/material.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/recent_video_card.dart';

class RecentsList extends StatelessWidget {
  const RecentsList();

  @override
  Widget build(BuildContext context) {
    final recentVideos = FakeData.videos.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Recent', style: context.t.headline4),
        ),
        const SizedBox(height: 12.0),
        SizedBox(
          height: 150.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recentVideos.length,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            separatorBuilder: (_, __) => const SizedBox(width: 12.0),
            itemBuilder: (context, index) {
              return RecentVideoCard(video: recentVideos[index]);
            },
          ),
        ),
      ],
    );
  }
}
