import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/data/models/recipe_model.dart';

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
        body: SizedBox(
          height: double.maxFinite,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double size = (constraints.maxHeight - constraints.maxWidth + 32) / constraints.maxHeight;
              return Stack(
                children: [
                  CachedNetworkImage(imageUrl: widget.recipe.image),
                  Positioned.fill(
                    child: DraggableScrollableSheet(
                      controller: controller,
                      initialChildSize: size,
                      minChildSize: size,
                      maxChildSize: 1,
                      expand: true,
                      snap: true,
                      builder: (context, scrollController) {
                        return ValueListenableBuilder(
                          valueListenable: dragSize,
                          builder: (context, dragSize, child) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular((1 - (dragSize ?? size)) / (1 - size) * 32),
                                ),
                              ),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                controller: scrollController,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 40,
                                          height: 5,
                                          margin: const EdgeInsets.symmetric(vertical: 16),
                                          decoration: const ShapeDecoration(
                                            color: AppColors.secondaryText,
                                            shape: StadiumBorder(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(widget.recipe.foodName, style: AppTypography.headerMedium),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${widget.recipe.type == FoodType.food ? TextManager.food : TextManager.drink} • ${widget.recipe.duration.label}',
                                        style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
