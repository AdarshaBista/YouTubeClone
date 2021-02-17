import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/widgets/common/page_transition.dart';

class NestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  final Widget child;
  final WillPopCallback onBackButtonPressed;

  NestedNavigator({
    @required this.child,
    this.onBackButtonPressed,
  }) : assert(child != null);

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
        onGenerateRoute: (_) => PageTransition(page: child),
      ),
    );
  }
}
