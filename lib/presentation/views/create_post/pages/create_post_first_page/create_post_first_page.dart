import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/components/duration_slider/duration_slider_container.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/components/food_description_input.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/components/food_name_input.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/components/food_name_label.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/components/food_type_selection/food_type_selection.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/components/post_image.dart';

class CreatePostFirstPage extends StatelessWidget {
  const CreatePostFirstPage({
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
                PostImage(),
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
