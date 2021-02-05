import 'package:meta/meta.dart';

class Playlist {
  final String name;
  final String imageUrl;
  final String channelName;
  final int videoCount;

  const Playlist({
    @required this.name,
    @required this.imageUrl,
    @required this.videoCount,
    this.channelName,
  })  : assert(name != null),
        assert(imageUrl != null),
        assert(videoCount != null);
}
