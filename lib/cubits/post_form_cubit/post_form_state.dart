part of 'post_form_cubit.dart';

class PostFormState {
  final String text;
  final List<String> imageUrls;

  Post get post => Post(
        text: text,
        user: FakeData.user,
        imageUrls: imageUrls,
        dateUpdated: DateTime.now(),
      );

  PostFormState({
    @required this.text,
    @required this.imageUrls,
  })  : assert(text != null),
        assert(imageUrls != null);

  PostFormState copyWith({
    String text,
    List<String> imageUrls,
  }) {
    return PostFormState(
      text: text ?? this.text,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}
