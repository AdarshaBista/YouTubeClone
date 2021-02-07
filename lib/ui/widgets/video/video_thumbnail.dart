import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/common/elevated_card.dart';

class VideoThumbnail extends StatelessWidget {
  final String imageUrl;
  final String duration;
  final double borderRadius;

  const VideoThumbnail({
    @required this.imageUrl,
    @required this.duration,
    this.borderRadius = 6.0,
  })  : assert(imageUrl != null),
        assert(duration != null),
        assert(borderRadius != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      radius: borderRadius,
      child: AspectRatio(
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
