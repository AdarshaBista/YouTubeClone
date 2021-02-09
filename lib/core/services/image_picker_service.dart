import 'package:images_picker/images_picker.dart';

class ImagePickerService {
  Future<List<String>> pickImagesFromGallery() async {
    final images = await ImagesPicker.pick(count: 10);
    if (images == null) return null;
    return images.map((i) => i.path).toList();
  }

  Future<List<String>> pickImagesFromCamera() async {
    final images = await ImagesPicker.openCamera();
    if (images == null) return null;
    return images.map((i) => i.path).toList();
  }
}
