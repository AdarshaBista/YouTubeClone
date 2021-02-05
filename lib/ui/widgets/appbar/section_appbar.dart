import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/appbar/appbar_icon.dart';
import 'package:youtube_clone/ui/widgets/appbar/video_search_delegate.dart';

class SectionAppbar extends AppBar {
  SectionAppbar(
    BuildContext context, {
    String title,
  }) : super(
          elevation: 2.0,
          shadowColor: AppColors.dark.withOpacity(0.4),
          title: Text(
            title,
            style: context.t.headline3,
          ),
          actions: [
            AppbarIcon(
              icon: Icons.search,
              onTap: () =>
                  showSearch(context: context, delegate: VideoSearchDelegate()),
            ),
            const AppbarIcon(icon: Icons.more_vert_outlined),
          ],
        );
}
