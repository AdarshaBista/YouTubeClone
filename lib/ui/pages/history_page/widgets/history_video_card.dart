import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/video.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/video/video_title.dart';
import 'package:youtube_clone/ui/widgets/video/video_thumbnail.dart';

class HistoryVideoCard extends StatelessWidget {
  final Video video;

  const HistoryVideoCard({
    @required this.video,
  }) : assert(video != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 9,
            child: VideoThumbnail(
              imageUrl: video.thumbnailUrl,
              duration: video.duration,
            ),
          ),
          const SizedBox(width: 12.0),
          Flexible(
            flex: 12,
            child: _buildDetails(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VideoTitle(title: video.name),
        const SizedBox(height: 2.0),
        Text(
          video.uploader.name,
          style: context.t.headline6,
        ),
        const SizedBox(height: 2.0),
        Text(
          '${video.views} views',
          style: context.t.headline6,
        ),
      ],
    );
  }
}
