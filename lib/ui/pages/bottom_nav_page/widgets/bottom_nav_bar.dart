import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/widgets/common/page_transition.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavItem> tabs;
  final void Function(int) onSelect;

  const BottomNavBar({
    @required this.tabs,
    @required this.onSelect,
    @required this.currentIndex,
  })  : assert(tabs != null),
        assert(onSelect != null),
        assert(currentIndex != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1.0),
        BottomNavigationBar(
          iconSize: 20.0,
          items: _getBottomNavBarItems(),
          currentIndex: currentIndex,
          onTap: onSelect,
        ),
      ],
    );
  }

  List<BottomNavigationBarItem> _getBottomNavBarItems() {
    return tabs
        .map((t) => BottomNavigationBarItem(
              label: t.title,
              icon: Icon(t.icon),
              activeIcon: Icon(t.activeIcon),
            ))
        .toList();
  }
}

class BottomNavItem {
  final Widget child;
  final String title;
  final IconData icon;
  final IconData activeIcon;

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  int index = 0;

  BottomNavItem({
    @required this.title,
    @required this.child,
    @required this.icon,
    @required this.activeIcon,
  })  : assert(icon != null),
        assert(title != null),
        assert(child != null),
        assert(activeIcon != null);

  Widget get page {
    return Navigator(
      key: key,
      onGenerateRoute: (_) => PageTransition(page: child),
    );
  }
}
