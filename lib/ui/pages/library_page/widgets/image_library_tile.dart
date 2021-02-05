import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/pages/library_page/widgets/library_tile.dart';

class ImageLibraryTile extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final String imageUrl;
  final VoidCallback onTap;

  const ImageLibraryTile({
    @required this.title,
    @required this.imageUrl,
    this.onTap,
    this.subtitle,
  })  : assert(title != null),
        assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return LibraryTile(
      onTap: onTap,
      title: title,
      subtitle: subtitle,
      leading: SizedBox(
        width: 32.0,
        height: 32.0,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
