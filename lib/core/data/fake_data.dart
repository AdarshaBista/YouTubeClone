import 'package:youtube_clone/core/models/user.dart';
import 'package:youtube_clone/core/models/video.dart';
import 'package:youtube_clone/core/models/channel.dart';
import 'package:youtube_clone/core/models/playlist.dart';

class FakeData {
  const FakeData._();

  static const List<String> suggestions = [
    'All',
    'Gaming',
    'Travel',
    'Chess Openings',
    'Programming',
    'Live',
    'Flutter',
    'Universe',
    'Soundtracks',
  ];

  static const channels = [
    Channel(
      name: 'exurb1a',
      imageUrl: 'assets/images/channels/exurb1a.jpg',
    ),
    Channel(
      name: 'Flutter',
      imageUrl: 'assets/images/channels/flutter.jpg',
    ),
    Channel(
      name: 'GothamChess',
      imageUrl: 'assets/images/channels/gotham_chess.jpg',
    ),
    Channel(
      name: 'Kalle Hallden',
      imageUrl: 'assets/images/channels/kalle_hallden.jpg',
    ),
    Channel(
      name: 'Lemmino',
      imageUrl: 'assets/images/channels/lemmino.jpg',
    ),
    Channel(
      name: 'Like Stories of Old',
      imageUrl: 'assets/images/channels/lsoo.jpg',
    ),
    Channel(
      name: 'Marques Brownlee',
      imageUrl: 'assets/images/channels/mkbhd.jpg',
    ),
    Channel(
      name: 'Mr. Suicide Sheep',
      imageUrl: 'assets/images/channels/mr_suicide_sheep.jpg',
    ),
    Channel(
      name: 'Reso Coder',
      imageUrl: 'assets/images/channels/reso_coder.jpg',
    ),
    Channel(
      name: 'Vsauce',
      imageUrl: 'assets/images/channels/vsauce.jpg',
    ),
  ];

  static final videos = [
    Video(
      name: 'The Rememberer',
      views: '1.3M',
      duration: '27:51',
      uploader: channels[0],
      publishedOn: '8 months ago',
      thumbnailUrl: 'assets/images/video_thumbnails/exurb1a1.jpg',
    ),
    Video(
      name: 'SliverAppBar (Flutter Widget of the Week)',
      views: '50K',
      duration: '1:12',
      uploader: channels[1],
      publishedOn: '3 months ago',
      thumbnailUrl: 'assets/images/video_thumbnails/flutter1.jpg',
    ),
    Video(
      name: '6 Checkmate Patterns YOU MUST KNOW',
      views: '417K',
      duration: '21:46',
      uploader: channels[2],
      publishedOn: '3 weeks ago',
      thumbnailUrl: 'assets/images/video_thumbnails/gotham_chess1.jpg',
    ),
    Video(
      name: 'One Day Builds: YouTube Clone Using Flutter!',
      views: '70K',
      duration: '19:01',
      uploader: channels[3],
      publishedOn: '8 months ago',
      thumbnailUrl: 'assets/images/video_thumbnails/kalle_hallden1.jpg',
    ),
    Video(
      name: 'Consumed by the Apocalypse',
      views: '2M',
      duration: '26:19',
      uploader: channels[4],
      publishedOn: '1 week ago',
      thumbnailUrl: 'assets/images/video_thumbnails/lemmino1.jpg',
    ),
    Video(
      name: 'Who We Really Are... When Everything Goes Wrong',
      views: '290K',
      duration: '24:21',
      uploader: channels[5],
      publishedOn: '1 month ago',
      thumbnailUrl: 'assets/images/video_thumbnails/lsoo1.jpg',
    ),
    Video(
      name: 'The Blind Smartphone Camera Test 2020!',
      views: '2.6M',
      duration: '17:07',
      uploader: channels[6],
      publishedOn: '1 month ago',
      thumbnailUrl: 'assets/images/video_thumbnails/mkbhd1.jpg',
    ),
    Video(
      name: 'Best of 2020 Mix',
      views: '294K',
      duration: '7:10:32',
      uploader: channels[7],
      publishedOn: '1 month ago',
      thumbnailUrl: 'assets/images/video_thumbnails/mr_suicide_sheep1.jpg',
    ),
    Video(
      name:
          'Flutter State Management Tutorial – Provider + ChangeNotifier, Bloc, MobX & More',
      views: '27K',
      duration: '26:45',
      uploader: channels[8],
      publishedOn: '9 months ago',
      thumbnailUrl: 'assets/images/video_thumbnails/reso_coder1.jpg',
    ),
    Video(
      name: 'What Will We Miss?',
      views: '26M',
      duration: '9:49',
      uploader: channels[9],
      publishedOn: '7 years ago',
      thumbnailUrl: 'assets/images/video_thumbnails/vsauce1.jpg',
    ),
  ];

  static const playlists = [
    Playlist(
        videoCount: 8,
        name: 'Mind Field: Season 1',
        imageUrl: 'assets/images/channels/vsauce.jpg',
        channelName: 'Mind Field'),
    Playlist(
        videoCount: 8,
        name: 'Mind Field: Season 2',
        imageUrl: 'assets/images/channels/vsauce.jpg',
        channelName: 'Mind Field'),
    Playlist(
        videoCount: 8,
        name: 'Mind Field: Season 3',
        imageUrl: 'assets/images/channels/vsauce.jpg',
        channelName: 'Mind Field'),
    Playlist(
      videoCount: 129,
      name: 'Music',
      imageUrl: 'assets/images/video_thumbnails/mr_suicide_sheep1.jpg',
    ),
    Playlist(
      videoCount: 74,
      name: 'Music 2',
      imageUrl: 'assets/images/video_thumbnails/mr_suicide_sheep1.jpg',
    ),
  ];

  static const user = User(
    id: '23abcefd',
    name: 'Marques Brownlee',
    avatarUrl: 'assets/images/channels/mkbhd.jpg',
  );
}
