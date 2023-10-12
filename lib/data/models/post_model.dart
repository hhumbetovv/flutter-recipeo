// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../constants/cooking_duration.dart';
import '../../constants/food_type.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String id, foodName, foodDescription, image;
  final FoodType type;
  final CookingDuration duration;
  final List<String> ingredients, steps;

  PostModel({
    required this.id,
    required this.foodName,
    required this.foodDescription,
    required this.image,
    required this.type,
    required this.duration,
    required this.ingredients,
    required this.steps,
  });
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  @override
  String toString() {
    return 'PostModel{id=$id, foodName=$foodName, foodDescription=$foodDescription, image=$image, type=$type, duration=$duration, ingredients=$ingredients, steps=$steps}';
  }
}
