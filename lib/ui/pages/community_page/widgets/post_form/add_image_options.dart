import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/styles/styles.dart';

class AddImageOptions extends StatelessWidget {
  const AddImageOptions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageOptionTile(
          label: 'Add image',
          color: Colors.green,
          icon: Icons.photo_outlined,
          onTap: () => context.read<PostFormCubit>().openGallery(),
        ),
        const Divider(),
        _ImageOptionTile(
          label: 'Open Camera',
          color: Colors.blue,
          icon: Icons.camera_alt_outlined,
          onTap: () => context.read<PostFormCubit>().openCamera(),
        ),
      ],
    );
  }
}

class _ImageOptionTile extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ImageOptionTile({
    @required this.color,
    @required this.label,
    @required this.icon,
    @required this.onTap,
  })  : assert(icon != null),
        assert(color != null),
        assert(label != null),
        assert(onTap != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 20.0,
        color: color,
      ),
      title: Text(
        label,
        style: context.t.headline5,
      ),
    );
  }
}
