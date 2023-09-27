import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipeo/data/models/post_model.dart';

class PostService {
  final CollectionReference _postsCollection = FirebaseFirestore.instance.collection('posts');
  Future<void> createPost({required PostModel post}) async {
    try {
      _postsCollection.doc(post.id).set(post.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePost({required PostModel post}) async {
    try {
      _postsCollection.doc(post.id).update(post.toJson());
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
