import 'package:flutter/material.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class SuggestionChips extends StatelessWidget implements PreferredSizeWidget {
  static const height = 40.0;

  const SuggestionChips();

  @override
  Widget build(BuildContext context) {
    const suggestions = FakeData.suggestions;

    return Column(
      children: [
        const Divider(),
        SizedBox(
          height: height,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return _buildChip(context, suggestions[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Center(child: Text(label, style: context.t.headline6)),
      decoration: BoxDecoration(
        color: context.c.surface,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
