import 'package:flutter/material.dart';

import 'package:youtube_clone/core/constants/images.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/appbar/section_appbar.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SectionAppbar(
        context,
        title: 'Downloads',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.empty,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            Text(
              'No Downloads',
              style: context.t.headline4.bold,
            ),
            const SizedBox(height: 4.0),
            Flexible(
              child: Text(
                "Use the download buton to save videos.\nWatch them next time you're oflfine!",
                textAlign: TextAlign.center,
                style: context.t.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
