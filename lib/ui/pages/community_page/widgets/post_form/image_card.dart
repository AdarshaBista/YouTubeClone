import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/styles/styles.dart';
import 'package:youtube_clone/ui/widgets/common/elevated_card.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({
    @required this.imageUrl,
  }) : assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ElevatedCard(
            margin: const EdgeInsets.all(6.0),
            child: Image.file(
              File(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.read<PostFormCubit>().removeImage(imageUrl),
          child: const CircleAvatar(
            radius: 10.0,
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.close,
              size: 16.0,
              color: AppColors.light,
            ),
          ),
        ),
      ],
    );
  }
}
