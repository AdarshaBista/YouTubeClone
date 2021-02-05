import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class VideoThumbnail extends StatelessWidget {
  final String imageUrl;
  final String duration;

  const VideoThumbnail({
    @required this.imageUrl,
    @required this.duration,
  })  : assert(imageUrl != null),
        assert(duration != null);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(imageUrl, fit: BoxFit.cover),
            _buildDurationIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationIndicator() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: AppColors.darkFaded,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(
        duration,
        style: AppTextStyles.headline6.light.bold,
      ),
    );
  }
}
