import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/widgets/common/page_transition.dart';

class NestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  final Widget child;
  final WillPopCallback onBackButtonPressed;
  final Widget Function(RouteSettings) pageBuilder;

  NestedNavigator({
    this.onBackButtonPressed,
    @required this.child,
    @required this.pageBuilder,
  })  : assert(child != null),
        assert(pageBuilder != null);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onBackButtonPressed != null) return onBackButtonPressed();

        final shouldPop = await _key.currentState.maybePop();
        return !shouldPop;
      },
      child: Navigator(
        key: _key,
        onGenerateRoute: (settings) {
          final page = settings.name == '/' ? child : pageBuilder(settings);
          return PageTransition(page: page);
        },
      ),
    );
  }
}
