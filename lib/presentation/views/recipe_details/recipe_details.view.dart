import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/data/models/recipe_model.dart';
import 'package:flutter_recipeo/data/models/user_model.dart';
import 'package:flutter_recipeo/data/services/user.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:flutter_recipeo/mixins/loading.state.dart';
import 'package:flutter_recipeo/presentation/dialogs/app_snackbar.dart';
import 'package:flutter_recipeo/presentation/views/recipe_details/components/recipe_info/recipe_info.dart';
import 'package:flutter_recipeo/presentation/views/recipe_details/components/recipe_sheet.dart';
import 'package:flutter_recipeo/presentation/views/recipe_details/components/sheet_drag.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'recipe_details.state.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final RecipeModel recipe;

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends _RecipeDetailsState {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Skeletonizer(
          ignoreContainers: false,
          enabled: isLoading,
          child: RecipeSheet(
            stackChildren: [
              CachedNetworkImage(imageUrl: widget.recipe.image),
            ],
            children: [
              const SheetDrag(),
              const SizedBox(height: 8),
              RecipeInfo(
                isLoading: isLoading,
                foodName: widget.recipe.foodName,
                type: widget.recipe.type,
                duration: widget.recipe.duration,
                image: author?.image,
                displayName: author?.displayName,
                uid: widget.recipe.authorId,
                likes: widget.recipe.likes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
