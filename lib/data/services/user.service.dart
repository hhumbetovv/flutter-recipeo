import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../../locator.dart';
import '../models/user_model.dart';
import 'auth.service.dart';
import 'storage.service.dart';

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
          recipes: [],
          liked: [],
          followers: [],
          following: [],
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

  Future<UserModel> getUser({required String? uid}) async {
    try {
      late final String? userId;
      if (uid != null && uid.isNotEmpty) {
        userId = uid;
      } else {
        userId = _authService.currentUserId;
      }
      final DocumentSnapshot snapshot = await _usersCollection.doc(userId).get();
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
