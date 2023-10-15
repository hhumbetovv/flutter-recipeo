import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../constants/cooking_duration.dart';
import '../../constants/food_type.dart';
import '../../locator.dart';
import '../models/recipe_model.dart';
import 'storage.service.dart';
import 'user.service.dart';

class RecipeService {
  final CollectionReference _recipeCollection = FirebaseFirestore.instance.collection('recipes');
  final StorageService _storageService = locator<StorageService>();
  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();

  Future<void> createRecipe({
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
      final String imageUrl = await _storageService.uploadRecipeImage(
        id: id,
        image: image,
      );
      final RecipeModel recipe = RecipeModel(
        id: id,
        authorId: _authService.currentUserId!,
        foodName: foodName,
        foodDescription: foodDescription,
        image: imageUrl,
        type: type,
        duration: duration,
        ingredients: ingredients,
        steps: steps,
        likes: 0,
      );
      await _recipeCollection.doc(id).set(recipe.toJson());
      await _userService.addRecipe(recipeId: id);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateRecipe({required RecipeModel recipe}) async {
    try {
      await _recipeCollection.doc(recipe.id).update(recipe.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<RecipeModel> getRecipe({required String id}) async {
    try {
      final DocumentSnapshot snapshot = await _recipeCollection.doc(id).get();
      final RecipeModel recipe = RecipeModel.fromJson(snapshot.data() as Map<String, dynamic>);
      return recipe;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteRecipe({required String id}) async {
    try {
      await _recipeCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
