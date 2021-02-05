import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/widgets/appbar/section_appbar.dart';
import 'package:youtube_clone/ui/pages/history_page/widgets/search_box.dart';
import 'package:youtube_clone/ui/pages/history_page/widgets/history_list.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppbar(
        context,
        title: 'History',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: const [
          SizedBox(height: 16.0),
          SearchBox(),
          SizedBox(height: 16.0),
          HistoryList(),
        ],
      ),
    );
  }
}
