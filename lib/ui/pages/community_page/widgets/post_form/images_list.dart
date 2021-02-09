import 'package:flutter/material.dart';

import 'package:youtube_clone/core/models/post.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/image_card.dart';

class ImagesList extends StatelessWidget {
  const ImagesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostFormCubit, Post>(
      builder: (context, state) {
        final imageUrls = state.imageUrls;
        if (imageUrls.isEmpty) return const Offstage();

        return SizedBox(
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return ImageCard(imageUrl: imageUrls[index]);
            },
          ),
        );
      },
    );
  }
}
