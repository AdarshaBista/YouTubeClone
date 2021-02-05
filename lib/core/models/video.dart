import 'package:meta/meta.dart';

import 'package:youtube_clone/core/models/channel.dart';

class Video {
  final String name;
  final String views;
  final String duration;
  final Channel uploader;
  final String publishedOn;
  final String thumbnailUrl;

  const Video({
    @required this.name,
    @required this.views,
    @required this.duration,
    @required this.uploader,
    @required this.publishedOn,
    @required this.thumbnailUrl,
  })  : assert(name != null),
        assert(views != null),
        assert(duration != null),
        assert(uploader != null),
        assert(publishedOn != null),
        assert(thumbnailUrl != null);
}
