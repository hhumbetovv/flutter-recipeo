import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipeo/data/models/user_model.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/data/services/storage.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:image_picker/image_picker.dart';

class UserService {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  final AuthService _authService = locator<AuthService>();
  final StorageService _storageService = locator<StorageService>();

  Future<void> createUser({
    required String displayName,
    required XFile? image,
  }) async {
    try {
      final String? uid = _authService.currentUserId;
      if (uid != null) {
        String? imageUrl;
        if (image != null) imageUrl = await _storageService.uploadUserImage(uid: uid, image: image);
        final UserModel user = UserModel(
          uid: uid,
          displayName: displayName,
          image: imageUrl,
          posts: [],
        );
        await _usersCollection.doc(user.uid).set(user.toJson());
      } else {
        throw 'There is no user';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser({required UserModel user}) async {
    try {
      await _usersCollection.doc(user.uid).update(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser({required String uid}) async {
    try {
      final DocumentSnapshot snapshot = await _usersCollection.doc(uid).get();
      final UserModel user = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getCurrentUser() async {
    final String? uid = _authService.currentUserId;
    try {
      if (uid != null) {
        final DocumentSnapshot snapshot = await _usersCollection.doc(uid).get();
        final UserModel user = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        return user;
      } else {
        throw 'There is no user';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser({required String uid}) async {
    final String? uid = _authService.currentUserId;
    try {
      if (uid != null) {
        await _usersCollection.doc(uid).delete();
      } else {
        throw 'There is no user';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addPost({required String postId}) async {
    final String? uid = _authService.currentUserId;
    try {
      if (uid != null) {
        UserModel user = await getCurrentUser();
        await updateUser(user: user.copyWithNewPost(id: postId));
      }
    } catch (e) {
      rethrow;
    }
  }
}
