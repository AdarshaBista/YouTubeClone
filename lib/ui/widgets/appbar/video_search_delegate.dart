import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class VideoSearchDelegate extends SearchDelegate {
  VideoSearchDelegate() : super(searchFieldLabel: 'Search YouTube');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Offstage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Offstage();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: TextTheme(subtitle1: context.t.headline5),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: context.t.headline5,
        helperStyle: context.t.headline5,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
