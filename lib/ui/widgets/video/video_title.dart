import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class VideoTitle extends StatelessWidget {
  final String title;
  final int maxLines;
  final TextStyle style;
  final double iconSize;

  const VideoTitle({
    @required this.title,
    this.style,
    this.maxLines = 2,
    this.iconSize = 16.0,
  })  : assert(title != null),
        assert(maxLines != null),
        assert(iconSize != null);

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? context.t.headline5;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            maxLines: maxLines,
            style: effectiveStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Icon(
          Icons.more_vert_outlined,
          size: 18.0,
        ),
      ],
    );
  }
}
