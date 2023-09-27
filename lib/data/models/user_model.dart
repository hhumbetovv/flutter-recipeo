import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String? displayName, image;
  final List<String> posts;

  UserModel({
    required this.uid,
    this.displayName,
    this.image,
    required this.posts,
  });
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
