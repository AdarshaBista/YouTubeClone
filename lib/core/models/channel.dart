import 'package:meta/meta.dart';

class Channel {
  final String name;
  final String imageUrl;

  const Channel({
    @required this.name,
    @required this.imageUrl,
  })  : assert(name != null),
        assert(imageUrl != null);
}
