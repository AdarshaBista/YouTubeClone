import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/common/elevated_card.dart';

class UserAvatar extends StatelessWidget {
  final String username;
  final String imageUrl;

  const UserAvatar({
    @required this.username,
    @required this.imageUrl,
  }) : assert(username != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: ElevatedCard(
        color: context.c.surface,
        child: imageUrl != null
            ? Image.asset(imageUrl)
            : Center(
                child: Text(
                  username[0].toUpperCase(),
                  style: context.t.headline3,
                ),
              ),
      ),
    );
  }
}
