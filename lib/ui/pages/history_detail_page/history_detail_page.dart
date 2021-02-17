import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'You viewed this video in the past.',
          style: context.t.headline4,
        ),
      ),
    );
  }
}
