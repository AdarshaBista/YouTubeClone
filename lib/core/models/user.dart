import 'package:meta/meta.dart';

class User {
  final String name;
  final String avatarUrl;

  const User({
    @required this.name,
    this.avatarUrl,
  }) : assert(name != null);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      name: map['name'] as String,
      avatarUrl: map['avatarUrl'] as String,
    );
  }
}
