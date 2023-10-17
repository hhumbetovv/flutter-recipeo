import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/cooking_duration.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

part 'parts/profile_info.dart';
part 'parts/recipe_likes.dart';
part 'parts/recipe_type_and_duration.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({
    Key? key,
    required this.isLoading,
    required this.foodName,
    required this.type,
    required this.duration,
    required this.image,
    required this.displayName,
    required this.uid,
    required this.likes,
  }) : super(key: key);

  final bool isLoading;
  final String foodName;
  final FoodType type;
  final CookingDuration duration;
  final String? image;
  final String? displayName;
  final String uid;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(foodName, style: AppTypography.headerMedium),
        const SizedBox(height: 8),
        _RecipeTypeAndInfo(type: type, duration: duration),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ProfileInfo(
              image: image,
              displayName: displayName,
              uid: uid,
            ),
            _RecipeLikes(isLoading: isLoading, likes: likes)
          ],
        ),
        const SizedBox(height: 16),
        const Divider(
          color: AppColors.outline,
          thickness: 1,
          height: 1,
        )
      ],
    );
  }
}
