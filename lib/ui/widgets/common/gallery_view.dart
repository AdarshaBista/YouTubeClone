import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:youtube_clone/ui/styles/app_colors.dart';

class GalleryView extends StatefulWidget {
  final int initialIndex;
  final List<String> imageUrls;

  const GalleryView({
    @required this.imageUrls,
    @required this.initialIndex,
  })  : assert(imageUrls != null),
        assert(initialIndex != null);

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      pageController: pageController,
      itemCount: widget.imageUrls.length,
      backgroundDecoration: BoxDecoration(color: AppColors.darkFaded),
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imageUrls[index]),
          maxScale: PhotoViewComputedScale.covered * 2.5,
          minScale: PhotoViewComputedScale.contained * 0.6,
          initialScale: PhotoViewComputedScale.contained * 1.0,
          heroAttributes: PhotoViewHeroAttributes(tag: widget.imageUrls[index]),
        );
      },
    );
  }
}
