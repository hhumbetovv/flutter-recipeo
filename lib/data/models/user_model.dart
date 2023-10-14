// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid, displayName;
  final String? image;
  final List<String> recipes, liked, followers, following;

  UserModel({
    required this.uid,
    required this.displayName,
    this.image,
    required this.recipes,
    required this.liked,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserModel copyWithNewRecipe({required String id}) {
    return UserModel(
      uid: uid,
      displayName: displayName,
      image: image,
      recipes: [...recipes, id],
      liked: liked,
      followers: followers,
      following: following,
    );
  }
}
