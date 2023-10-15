import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/cooking_duration.dart';
import '../../../constants/food_type.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import '../../../data/models/recipe_model.dart';
import '../../../data/services/recipe.service.dart';
import '../../../locator.dart';
import '../../../mixins/loading.state.dart';
import '../../dialogs/app_snackbar.dart';
import '../app_ink_well.dart';

part 'parts/food_name.dart';
part 'parts/recipe_image.dart';
part 'parts/recipe_info.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  final String? recipeId;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> with LoadingState {
  RecipeModel? recipe;

  @override
  void initState() {
    super.initState();
    if (widget.recipeId != null) getRecipeModel();
  }

  void getRecipeModel() async {
    if (mounted) toggleLoading();
    try {
      await Future.delayed(const Duration(seconds: 3));
      final RecipeService recipeService = locator<RecipeService>();
      recipe = await recipeService.getRecipe(id: widget.recipeId!);
    } catch (e) {
      if (mounted) showAppSnackBar(context, e.toString());
    }
    if (mounted) toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: recipe == null ? null : () => context.push(Routes.recipeDetails, extra: recipe?.toJson()),
      child: Skeletonizer(
        enabled: widget.recipeId == null ? false : isLoading,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RecipeImage(image: recipe?.image),
            const SizedBox(height: 16),
            _FoodName(foodName: recipe?.foodName),
            const SizedBox(height: 8),
            _RecipeInfo(
              type: recipe?.type ?? FoodType.food,
              duration: recipe?.duration ?? CookingDuration.lessThanTen,
            ),
          ],
        ),
      ),
    );
  }
}
