import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_second_page/components/add_ingredient_button.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_second_page/components/ingredient_list/ingredient_list.dart';

class CreatePostSecondPage extends StatelessWidget {
  const CreatePostSecondPage({
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
            SizedBox(height: 45),
            Text(
              TextManager.ingredients,
              style: AppTypography.headerMedium,
            ),
            SizedBox(height: 26),
            IngredientList(),
            SizedBox(height: 8),
            AddIngredientButton(),
            SizedBox(height: 24),
            Divider(color: AppColors.form, thickness: 8),
            SizedBox(height: 24),
            Text(
              TextManager.steps,
              style: AppTypography.headerMedium,
            ),
          ],
        ),
      ),
    );
  }
}
