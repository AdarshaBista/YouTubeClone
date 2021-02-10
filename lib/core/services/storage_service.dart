import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final String folder;
  final FirebaseStorage storage = FirebaseStorage.instance;

  StorageService(this.folder);

  Future<List<String>> uploadImages(List<String> imageUrls) async {
    final List<String> uploadedImageUrls = [];

    for (final url in imageUrls) {
      final fileName = url.split('/').last;
      final path = '$folder/$fileName';
      await storage.ref(path).putFile(File(url));
      final downloadUrl = await storage.ref(path).getDownloadURL();
      uploadedImageUrls.add(downloadUrl);
    }

    return uploadedImageUrls;
  }

  Future<void> deleteImages(List<String> imageUrls) async {
    for (final url in imageUrls) {
      await storage.refFromURL(url).delete();
    }
  }
}
