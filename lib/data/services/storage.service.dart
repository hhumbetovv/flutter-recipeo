import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadUserImage({required String uid, required XFile image}) async {
    try {
      String imagePath = 'users/$uid.${image.path.split(".").last}';
      final TaskSnapshot snapshot = await _storage.ref().child(imagePath).putFile(File(image.path));
      final String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadRecipeImage({required String id, required XFile image}) async {
    try {
      final String imagePath = 'recipes/$id.${image.path.split(".").last}';
      final TaskSnapshot snapshot = await _storage.ref().child(imagePath).putFile(File(image.path));
      final String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteImage({required String path}) async {
    try {
      final Reference reference = _storage.ref().child(path);
      await reference.delete();
    } catch (e) {
      rethrow;
    }
  }
}
