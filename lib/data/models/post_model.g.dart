// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as String,
      foodName: json['foodName'] as String,
      foodDescription: json['foodDescription'] as String,
      image: json['image'] as String,
      type: $enumDecode(_$FoodTypeEnumMap, json['type']),
      duration: $enumDecode(_$CookingDurationEnumMap, json['duration']),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'foodName': instance.foodName,
      'foodDescription': instance.foodDescription,
      'image': instance.image,
      'type': _$FoodTypeEnumMap[instance.type]!,
      'duration': _$CookingDurationEnumMap[instance.duration]!,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
    };

const _$FoodTypeEnumMap = {
  FoodType.food: 'food',
  FoodType.drink: 'drink',
};

const _$CookingDurationEnumMap = {
  CookingDuration.lessThanTen: 'lessThanTen',
  CookingDuration.thirty: 'thirty',
  CookingDuration.moreThanSixty: 'moreThanSixty',
};
