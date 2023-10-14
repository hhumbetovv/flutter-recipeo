import 'package:flutter/material.dart';

import 'recipe_card/recipe_card.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<String?> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      physics: const BouncingScrollPhysics(),
      itemCount: recipes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 24,
        mainAxisExtent: MediaQuery.sizeOf(context).width / 2 + 30,
      ),
      itemBuilder: (context, index) {
        return RecipeCard(recipeId: recipes[index]);
      },
    );
  }
}
