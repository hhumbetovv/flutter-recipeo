// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      image: json['image'] as String?,
      recipes:
          (json['recipes'] as List<dynamic>).map((e) => e as String).toList(),
      liked: (json['liked'] as List<dynamic>).map((e) => e as String).toList(),
      followers:
          (json['followers'] as List<dynamic>).map((e) => e as String).toList(),
      following:
          (json['following'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'image': instance.image,
      'recipes': instance.recipes,
      'liked': instance.liked,
      'followers': instance.followers,
      'following': instance.following,
    };
