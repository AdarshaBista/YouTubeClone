import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/widgets/appbar/persistent_appbar.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/recents_list.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/playlist_list.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/icon_library_tile.dart';

import 'package:youtube_clone/ui/pages/history_page/history_page.dart';
import 'package:youtube_clone/ui/pages/downloads_page/downloads_page.dart';
import 'package:youtube_clone/ui/widgets/common/page_transition.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const PersistentAppbar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(height: 12.0),
              const RecentsList(),
              const Divider(height: 16.0),
              IconLibraryTile(
                title: 'History',
                icon: Icons.history_outlined,
                onTap: () => _navigateToHistoryPage(context),
              ),
              IconLibraryTile(
                title: 'Downloads',
                icon: Icons.download_outlined,
                subtitle: '0 videos',
                onTap: () => _navigateToDownloadsPage(context),
              ),
              const IconLibraryTile(
                title: 'Your Videos',
                icon: Icons.ondemand_video_outlined,
              ),
              const IconLibraryTile(
                title: 'Your Movies',
                icon: Icons.local_movies_outlined,
              ),
              const IconLibraryTile(
                title: 'Watch Later',
                icon: Icons.access_time_outlined,
                subtitle: '3 unwatched videos',
              ),
              const Divider(),
              const SizedBox(height: 12.0),
              const PlaylistList(),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToDownloadsPage(BuildContext context) {
    Navigator.of(context).push(
      PageTransition(page: const DownloadsPage()),
    );
  }

  void _navigateToHistoryPage(BuildContext context) {
    Navigator.of(context).push(
      PageTransition(page: const HistoryPage()),
    );
  }
}
