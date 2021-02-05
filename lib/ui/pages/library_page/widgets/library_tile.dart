import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class LibraryTile extends StatelessWidget {
  final Color color;
  final String title;
  final Widget subtitle;
  final Widget leading;
  final VoidCallback onTap;

  const LibraryTile({
    @required this.title,
    @required this.leading,
    this.color,
    this.onTap,
    this.subtitle,
  })  : assert(title != null),
        assert(leading != null);

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? context.c.onBackground;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        horizontalTitleGap: 10.0,
        visualDensity: VisualDensity.compact,
        leading: leading,
        subtitle: subtitle,
        title: Text(
          title,
          style: context.t.headline5.withColor(effectiveColor),
        ),
      ),
    );
  }
}
