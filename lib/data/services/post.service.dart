import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../constants/cooking_duration.dart';
import '../../constants/food_type.dart';
import '../../locator.dart';
import '../models/post_model.dart';
import 'storage.service.dart';
import 'user.service.dart';

class PostService {
  final CollectionReference _postsCollection = FirebaseFirestore.instance.collection('posts');
  final StorageService _storageService = locator<StorageService>();
  final UserService _userService = locator<UserService>();

  Future<void> createPost({
    required String foodName,
    required String foodDescription,
    required XFile image,
    required FoodType type,
    required CookingDuration duration,
    required List<String> ingredients,
    required List<String> steps,
  }) async {
    try {
      final String id = const Uuid().v4();
      final String imageUrl = await _storageService.uploadPostImage(
        id: id,
        image: image,
      );
      final PostModel post = PostModel(
        id: id,
        foodName: foodName,
        foodDescription: foodDescription,
        image: imageUrl,
        type: type,
        duration: duration,
        ingredients: ingredients,
        steps: steps,
      );
      await _postsCollection.doc(id).set(post.toJson());
      await _userService.addPost(postId: id);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePost({required PostModel post}) async {
    try {
      await _postsCollection.doc(post.id).update(post.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<PostModel> getPost({required String id}) async {
    try {
      final DocumentSnapshot snapshot = await _postsCollection.doc(id).get();
      final PostModel post = PostModel.fromJson(snapshot.data() as Map<String, dynamic>);
      return post;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePost({required String id}) async {
    try {
      await _postsCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
