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
    this.id,
    this.user,
    this.dateUpdated,
    this.text = '',
    this.imageUrls = const [],
  })  : assert(text != null),
        assert(imageUrls != null);

  Post copyWith({
    User user,
    String id,
    String text,
    DateTime dateUpdated,
    List<String> imageUrls,
  }) {
    return Post(
      id: id ?? this.id,
      user: user ?? this.user,
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls,
      dateUpdated: dateUpdated ?? this.dateUpdated,
    );
  }
}
