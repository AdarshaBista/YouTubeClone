import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/common/gallery_view.dart';
import 'package:youtube_clone/ui/widgets/common/elevated_card.dart';

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
    if (imageUrls.length == 1) return _buildImage(context, 0);

    final maxImages = math.min(imageUrls.length, _layout.length + 1);
    return StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      itemCount: maxImages,
      staggeredTileBuilder: (int index) => _layout[maxImages][index],
      itemBuilder: (context, index) => _buildItem(context, index, maxImages),
    );
  }

  Widget _buildItem(BuildContext context, int index, int maxImages) {
    if (index + 1 < maxImages) return _buildImage(context, index);

    final remaining = imageUrls.length - maxImages;
    if (remaining == 0) return _buildImage(context, index);

    return _buildRemaining(context, remaining, index);
  }

  Widget _buildRemaining(BuildContext context, int remaining, int index) {
    return ElevatedCard(
      child: GestureDetector(
        onTap: () => _openGallery(context, index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrls[index]),
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
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, int index) {
    return ElevatedCard(
      child: GestureDetector(
        onTap: () => _openGallery(context, index),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 80.0,
            maxHeight: 500.0,
          ),
          child: Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return GalleryView(
          initialIndex: index,
          imageUrls: imageUrls,
        );
      },
    );
  }
}
