import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File image, String path) async {
    try {
      final TaskSnapshot snapshot = await _storage.ref().child(path).putFile(image);
      final String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteImage(String path) async {
    try {
      final Reference reference = _storage.ref().child(path);
      await reference.delete();
    } catch (e) {
      rethrow;
    }
  }
}
