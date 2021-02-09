import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/cubits/post_form_cubit/post_form_cubit.dart';

import 'package:youtube_clone/ui/pages/community_page/widgets/post_form/image_card.dart';

class ImagesList extends StatelessWidget {
  const ImagesList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: BlocBuilder<PostFormCubit, PostFormState>(
        builder: (context, state) {
          final imageUrls = state.imageUrls;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) =>
                ImageCard(imageUrl: imageUrls[index]),
          );
        },
      ),
    );
  }
}
