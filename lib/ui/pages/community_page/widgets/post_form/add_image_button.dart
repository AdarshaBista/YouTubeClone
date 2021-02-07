import 'package:flutter/material.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 0.0,
      onTap: () => _showImageSheet(context),
      leading: const Icon(
        Icons.photo_outlined,
        size: 24.0,
        color: AppColors.primary,
      ),
      title: Text(
        'Add Image',
        style: context.t.headline4,
      ),
    );
  }

  void _showImageSheet(BuildContext context) {}
}
