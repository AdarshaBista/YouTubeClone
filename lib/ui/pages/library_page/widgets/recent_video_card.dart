import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/video.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/video/video_title.dart';
import 'package:youtube_clone/ui/widgets/video/video_thumbnail.dart';

class RecentVideoCard extends StatelessWidget {
  final Video video;

  const RecentVideoCard({
    @required this.video,
  }) : assert(video != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoThumbnail(
            duration: video.duration,
            imageUrl: video.thumbnailUrl,
          ),
          const SizedBox(height: 8.0),
          VideoTitle(title: video.name),
          const SizedBox(height: 2.0),
          _buildChannelTitle(context),
        ],
      ),
    );
  }

  Widget _buildChannelTitle(BuildContext context) {
    return Text(
      video.uploader.name,
      maxLines: 1,
      style: context.t.headline6,
      overflow: TextOverflow.ellipsis,
    );
  }
}
