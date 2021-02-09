import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/core/models/post.dart';
import 'package:youtube_clone/core/services/posts_service.dart';

part 'post_form_state.dart';

class PostFormCubit extends Cubit<PostFormState> {
  final PostsService postsService;

  PostFormCubit({
    @required this.postsService,
  })  : assert(postsService != null),
        super(PostFormState(text: '', imageUrls: const []));

  void changeText(String text) {
    emit(state.copyWith(text: text));
  }

  void addImage(String url) {
    final imageUrls = List<String>.from(state.imageUrls);
    imageUrls.add(url);
    emit(state.copyWith(imageUrls: imageUrls));
  }

  void removeImage(String url) {
    final imageUrls = List<String>.from(state.imageUrls);
    imageUrls.remove(url);
    emit(state.copyWith(imageUrls: imageUrls));
  }
}
