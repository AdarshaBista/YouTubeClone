import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class PointSeparator extends StatelessWidget {
  const PointSeparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 6.0),
        CircleAvatar(radius: 1.0, backgroundColor: context.t.headline6.color),
        const SizedBox(width: 6.0),
      ],
    );
  }
}
