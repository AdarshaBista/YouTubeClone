import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/appbar/section_appbar.dart';
import 'package:youtube_clone/ui/widgets/common/nested_navigator.dart';
import 'package:youtube_clone/ui/pages/history_page/widgets/search_box.dart';
import 'package:youtube_clone/ui/pages/history_page/widgets/history_list.dart';

import 'package:youtube_clone/ui/pages/history_detail_page/history_detail_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppbar(
        context,
        title: 'History',
      ),
      body: NestedNavigator(
        pageBuilder: (settings) {
          switch (settings.name) {
            case '/history_detail':
              return const HistoryDetailPage();
            default:
              return _buildDefaultPage(context, settings.name);
          }
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          children: const [
            SizedBox(height: 16.0),
            SearchBox(),
            SizedBox(height: 16.0),
            HistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultPage(BuildContext context, String routeName) {
    return Scaffold(
      body: Center(
        child: Text(
          'No route found for $routeName',
          style: context.t.headline4,
        ),
      ),
    );
  }
}
