import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class AppbarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AppbarIcon({
    @required this.icon,
    this.onTap,
  }) : assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24.0,
        color: context.c.onBackground,
      ),
    );
  }
}
