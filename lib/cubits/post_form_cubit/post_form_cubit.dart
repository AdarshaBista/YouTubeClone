import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:youtube_clone/core/data/fake_data.dart';

import 'package:youtube_clone/core/models/post.dart';
import 'package:youtube_clone/core/services/posts_service.dart';
import 'package:youtube_clone/core/services/image_picker_service.dart';

part 'post_form_state.dart';

class PostFormCubit extends Cubit<PostFormState> {
  final PostsService postsService;
  final ImagePickerService imagePickerService;

  PostFormCubit({
    @required this.postsService,
    @required this.imagePickerService,
  })  : assert(postsService != null),
        assert(imagePickerService != null),
        super(PostFormState(text: '', imageUrls: const []));

  void changeText(String text) {
    emit(state.copyWith(text: text));
  }

  void removeImage(String url) {
    final imageUrls = List<String>.from(state.imageUrls);
    imageUrls.remove(url);
    emit(state.copyWith(imageUrls: imageUrls));
  }

  Future<void> openGallery() async {
    final imageUrls = await imagePickerService.pickImagesFromGallery();
    if (imageUrls != null) _addImages(imageUrls);
  }

  Future<void> openCamera() async {
    final imageUrls = await imagePickerService.pickImagesFromCamera();
    if (imageUrls != null) _addImages(imageUrls);
  }

  void _addImages(List<String> urls) {
    final imageUrls = List<String>.from(state.imageUrls);
    imageUrls.addAll(urls);
    emit(state.copyWith(imageUrls: imageUrls));
  }
}
