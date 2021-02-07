import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/video.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/common/point_separator.dart';
import 'package:youtube_clone/ui/widgets/video/video_title.dart';
import 'package:youtube_clone/ui/widgets/video/video_thumbnail.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({
    @required this.video,
  }) : assert(video != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoThumbnail(
            borderRadius: 0.0,
            duration: video.duration,
            imageUrl: video.thumbnailUrl,
          ),
          const SizedBox(height: 12.0),
          _buildTitle(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      leading: CircleAvatar(
        backgroundImage: AssetImage(video.uploader.imageUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoTitle(title: video.name, iconSize: 18.0),
          const SizedBox(height: 4.0),
          _buildVideoDetails(context),
        ],
      ),
    );
  }

  Widget _buildVideoDetails(BuildContext context) {
    return Row(
      children: [
        Text(
          video.uploader.name,
          style: context.t.headline6,
        ),
        const PointSeparator(),
        Text(
          '${video.views} views',
          style: context.t.headline6,
        ),
        const PointSeparator(),
        Text(
          video.publishedOn,
          style: context.t.headline6,
        ),
      ],
    );
  }
}
