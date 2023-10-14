import 'package:flutter/material.dart';

import '../../../../../constants/text_manager.dart';
import '../../../../../constants/typography.dart';
import 'components/duration_slider/duration_slider_container.dart';
import 'components/food_description_input.dart';
import 'components/food_name_input.dart';
import 'components/food_name_label.dart';
import 'components/food_type_selection/food_type_selection.dart';
import 'components/recipe_image.dart';

class UploadRecipeFirstPage extends StatelessWidget {
  const UploadRecipeFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                RecipeImage(),
                SizedBox(width: 16),
                FoodTypeSelection(),
              ],
            ),
            SizedBox(height: 24),
            FoodNameLabel(),
            SizedBox(height: 10),
            FoodNameInput(),
            SizedBox(height: 24),
            Text(
              TextManager.description,
              style: AppTypography.headerMedium,
            ),
            SizedBox(height: 10),
            FoodDescriptionInput(),
            SizedBox(height: 24),
            DurationSliderContainer(),
          ],
        ),
      ),
    );
  }
}
