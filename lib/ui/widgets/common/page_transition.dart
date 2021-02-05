import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition({
    @required this.page,
  })  : assert(page != null),
        super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(animation),
              child: child,
            );
          },
        );
}
