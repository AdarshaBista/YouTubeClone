import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagesGrid extends StatelessWidget {
  final List<String> imageUrls;

  static const Map<int, List<StaggeredTile>> _layout = {
    2: [
      StaggeredTile.count(3, 4),
      StaggeredTile.count(3, 4),
    ],
    3: [
      StaggeredTile.count(6, 3),
      StaggeredTile.count(3, 3),
      StaggeredTile.count(3, 3),
    ],
    4: [
      StaggeredTile.count(4, 6),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 2),
    ],
    5: [
      StaggeredTile.count(3, 3),
      StaggeredTile.count(3, 3),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 2),
    ],
  };

  const ImagesGrid({
    @required this.imageUrls,
  }) : assert(imageUrls != null);

  @override
  Widget build(BuildContext context) {
    if (imageUrls.length == 1) return _buildImage(imageUrls.first);

    final maxImages = math.min(imageUrls.length, _layout.length + 1);
    return StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 6,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: maxImages,
      staggeredTileBuilder: (int index) => _layout[maxImages][index],
      itemBuilder: (context, index) => _buildItem(context, index, maxImages),
    );
  }

  Widget _buildItem(BuildContext context, int index, int maxImages) {
    final imageUrl = imageUrls[index];

    if (index + 1 < maxImages) return _buildImage(imageUrl);

    final remaining = imageUrls.length - maxImages;
    if (remaining == 0) return _buildImage(imageUrl);

    return _buildRemaining(remaining, imageUrl);
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
      constraints: const BoxConstraints(
        minHeight: 80.0,
        maxHeight: 500.0,
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
