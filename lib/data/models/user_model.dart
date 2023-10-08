import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String? displayName, image;
  final List<String> posts, followers, following;

  UserModel({
    required this.uid,
    this.displayName,
    this.image,
    required this.posts,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserModel copyWithNewPost({required String id}) {
    return UserModel(
      uid: uid,
      displayName: displayName,
      image: image,
      posts: [...posts, id],
      followers: followers,
      following: following,
    );
  }
}
