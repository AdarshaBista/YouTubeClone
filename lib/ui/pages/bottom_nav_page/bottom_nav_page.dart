import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/pages/home_page/home_page.dart';
import 'package:youtube_clone/ui/pages/library_page/library_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage();

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(context),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomePage(),
          const LibraryPage(),
          Container(color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1.0),
          BottomNavigationBar(
            iconSize: 20.0,
            items: _bottomNavBarItems,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }

  static const _bottomNavBarItems = [
    BottomNavigationBarItem(
      label: 'Home',
      activeIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
    ),
    BottomNavigationBarItem(
      label: 'Library',
      activeIcon: Icon(Icons.video_library),
      icon: Icon(Icons.video_library_outlined),
    ),
    BottomNavigationBarItem(
      label: 'Community',
      activeIcon: Icon(Icons.people_alt),
      icon: Icon(Icons.people_alt_outlined),
    ),
  ];
}
