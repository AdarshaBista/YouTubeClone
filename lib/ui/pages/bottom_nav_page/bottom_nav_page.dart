import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/pages/bottom_nav_page/widgets/bottom_nav_bar.dart';

import 'package:youtube_clone/ui/pages/home_page/home_page.dart';
import 'package:youtube_clone/ui/pages/library_page/library_page.dart';
import 'package:youtube_clone/ui/pages/community_page/community_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage();

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  final _tabs = [
    BottomNavItem(
      title: 'Home',
      activeIcon: Icons.home,
      icon: Icons.home_outlined,
      child: const HomePage(),
    ),
    BottomNavItem(
      title: 'Library',
      activeIcon: Icons.video_library,
      icon: Icons.video_library_outlined,
      child: const LibraryPage(),
    ),
    BottomNavItem(
      title: 'Community',
      activeIcon: Icons.people_alt,
      icon: Icons.people_alt_outlined,
      child: const CommunityPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackButtonPressed,
      child: Container(
        color: context.c.background,
        child: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavBar(
              tabs: _tabs,
              onSelect: _selectTab,
              currentIndex: _selectedIndex,
            ),
            body: IndexedStack(
              index: _selectedIndex,
              children: _tabs.map((t) => t.page).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _selectTab(int index) {
    if (index == _selectedIndex) {
      // Navigate to the first route of the tab.
      _tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  Future<bool> _onBackButtonPressed() async {
    // If the route cannot be popped, we are on the first route of the tab.
    final isFirstRouteInCurrentTab =
        !await _tabs[_selectedIndex].key.currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (_selectedIndex != 0) {
        // Navigate to home page.
        _selectTab(0);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }
}
