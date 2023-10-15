// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../constants/cooking_duration.dart';
import '../../constants/food_type.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel {
  final String id, authorId, foodName, foodDescription, image;
  final FoodType type;
  final CookingDuration duration;
  final List<String> ingredients, steps;
  final int likes;

  RecipeModel({
    required this.id,
    required this.authorId,
    required this.foodName,
    required this.foodDescription,
    required this.image,
    required this.type,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.likes,
  });
  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

  @override
  String toString() {
    return 'RecipeModel{id=$id, foodName=$foodName, foodDescription=$foodDescription, image=$image, type=$type, duration=$duration, ingredients=$ingredients, steps=$steps}';
  }
}
