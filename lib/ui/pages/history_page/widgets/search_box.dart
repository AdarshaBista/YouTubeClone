import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.t.headline5,
      decoration: InputDecoration(
        hintText: 'Search watch history',
        prefixIcon: Icon(
          Icons.search,
          size: 20.0,
          color: context.c.onSurface,
        ),
      ),
    );
  }
}
