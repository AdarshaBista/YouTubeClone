import 'package:timeago/timeago.dart' as timeago;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:youtube_clone/core/models/user.dart';

class Post {
  final String id;
  final User user;
  final String text;
  final DateTime updatedAt;
  final List<String> imageUrls;

  String get timeAgo => timeago.format(updatedAt);

  Post({
    this.id,
    this.user,
    this.updatedAt,
    this.text = '',
    this.imageUrls = const [],
  })  : assert(text != null),
        assert(imageUrls != null);

  Post copyWith({
    User user,
    String id,
    String text,
    DateTime updatedAt,
    List<String> imageUrls,
  }) {
    return Post(
      id: id ?? this.id,
      user: user ?? this.user,
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'user': user?.toMap(),
      'imageUrls': imageUrls,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Post.fromDocument(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Post(
      id: snapshot.id,
      text: data['text'] as String,
      imageUrls: List<String>.from(data['imageUrls'] as List),
      user: User.fromMap(data['user'] as Map<String, dynamic>),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updatedAt'] as int),
    );
  }
}
