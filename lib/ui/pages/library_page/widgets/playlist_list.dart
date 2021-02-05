import 'package:flutter/material.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/core/models/playlist.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/common/point_separator.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/icon_library_tile.dart';
import 'package:youtube_clone/ui/pages/library_page/widgets/image_library_tile.dart';

class PlaylistList extends StatelessWidget {
  const PlaylistList();

  @override
  Widget build(BuildContext context) {
    const playlists = FakeData.playlists;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 12.0),
        const IconLibraryTile(
          color: Colors.blue,
          title: 'New playlist',
          icon: Icons.add_outlined,
        ),
        const IconLibraryTile(
          title: 'Liked Videos',
          icon: Icons.thumb_up_alt_outlined,
        ),
        ...playlists.map((p) => _buildPlalistTile(context, p)).toList(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text('Playlists', style: context.t.headline4),
          const Spacer(),
          Text('A-Z', style: context.t.headline5),
          const SizedBox(width: 4.0),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 24.0,
            color: context.t.headline5.color,
          ),
        ],
      ),
    );
  }

  Widget _buildPlalistTile(BuildContext context, Playlist playlist) {
    return ImageLibraryTile(
      title: playlist.name,
      imageUrl: playlist.imageUrl,
      subtitle: Row(
        children: [
          if (playlist.channelName != null) ...[
            Text(
              playlist.channelName,
              style: context.t.headline6,
            ),
            const PointSeparator(),
          ],
          Text(
            '${playlist.videoCount} videos',
            style: context.t.headline6,
          ),
        ],
      ),
    );
  }
}
