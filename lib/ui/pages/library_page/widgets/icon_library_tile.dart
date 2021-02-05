import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/library_tile.dart';

class IconLibraryTile extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const IconLibraryTile({
    @required this.title,
    @required this.icon,
    this.onTap,
    this.subtitle,
    this.color,
  })  : assert(icon != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return LibraryTile(
      onTap: onTap,
      title: title,
      color: color,
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: context.t.headline6,
            ),
      leading: SizedBox(
        height: double.infinity,
        child: Icon(
          icon,
          size: 22.0,
          color: color ?? context.c.onBackground,
        ),
      ),
    );
  }
}
