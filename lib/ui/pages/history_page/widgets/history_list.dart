import 'package:flutter/material.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/history_page/widgets/history_video_card.dart';

class HistoryList extends StatelessWidget {
  const HistoryList();

  @override
  Widget build(BuildContext context) {
    final videos = FakeData.videos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today', style: context.t.headline5),
        const SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return HistoryVideoCard(video: videos[index]);
          },
        ),
      ],
    );
  }
}
