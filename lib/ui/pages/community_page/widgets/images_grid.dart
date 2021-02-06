import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class ImagesGrid extends StatelessWidget {
  final int maxImages;
  final List<String> imageUrls;

  const ImagesGrid({
    @required this.imageUrls,
    @required this.maxImages,
  })  : assert(imageUrls != null),
        assert(maxImages != null);

  @override
  Widget build(BuildContext context) {
    if (imageUrls.length == 1) return _buildImage(imageUrls.first);
    return _buildGrid();
  }

  Widget _buildGrid() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildImages(),
    );
  }

  List<Widget> _buildImages() {
    final numImages = imageUrls.length;
    final gridSize = math.min(numImages, maxImages);

    return List<Widget>.generate(gridSize, (index) {
      final imageUrl = imageUrls[index];
      if (index != maxImages - 1) return _buildImage(imageUrl);

      final remaining = numImages - maxImages;
      if (remaining == 0) return _buildImage(imageUrl);

      return _buildRemaining(remaining, imageUrl);
    });
  }

  Widget _buildRemaining(int remaining, String imageUrl) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.darkFaded,
            BlendMode.srcATop,
          ),
        ),
      ),
      child: Text(
        '+$remaining',
        style: AppTextStyles.headline1.light.thin,
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 500.0),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
