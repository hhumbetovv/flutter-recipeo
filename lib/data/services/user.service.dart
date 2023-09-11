import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipeo/data/models/user.model.dart';

class UserService {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required UserModel user}) async {
    try {
      _usersCollection.doc(user.uid).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser({required UserModel user}) async {
    try {
      _usersCollection.doc(user.uid).update(user.toJson());
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

  Future<void> deleteUser({required String uid}) async {
    try {
      await _usersCollection.doc(uid).delete();
    } catch (e) {
      rethrow;
    }
  }
}
