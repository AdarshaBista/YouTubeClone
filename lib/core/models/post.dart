import 'package:meta/meta.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'package:youtube_clone/core/models/user.dart';

class Post {
  final User user;
  final String id;
  final String text;
  final DateTime dateUpdated;
  final List<String> imageUrls;

  String get timeAgo => timeago.format(dateUpdated);

  const Post({
    @required this.id,
    @required this.text,
    @required this.user,
    @required this.dateUpdated,
    this.imageUrls = const [],
  })  : assert(id != null),
        assert(text != null),
        assert(user != null),
        assert(imageUrls != null),
        assert(dateUpdated != null);
}
