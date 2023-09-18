import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/mixins/loading.state.dart';
import 'package:flutter_recipeo/presentation/dialogs/app_snackbar.dart';
import 'package:flutter_recipeo/presentation/dialogs/image_source_sheet/image_source_sheet.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary_button.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base_decoration.dart';
import 'package:flutter_recipeo/presentation/global/inputs/text_area_decoration.dart';
import 'package:flutter_recipeo/presentation/views/create_post/components/duration_slider/duration_slider_container.dart';
import 'package:flutter_recipeo/presentation/views/create_post/components/food_type_selection/food_type_selection.dart';
import 'package:flutter_recipeo/presentation/views/create_post/components/post_image.dart';
import 'package:flutter_recipeo/presentation/views/create_post/components/top_row.dart';
import 'package:image_picker/image_picker.dart';

part 'create_post.state.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends _CreatePostState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const TopRow(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          PostImage(
                            image: postImage,
                            hasError: imageError,
                            onTap: pickImage,
                          ),
                          const SizedBox(width: 16),
                          FoodTypeSelection(
                            value: foodType,
                            onSelectionChanged: onFoodSelectionChanged,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        TextManager.foodName,
                        style: AppTypography.headerMedium,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        cursorColor: AppColors.primary,
                        controller: nameController,
                        decoration: BaseInputDecoration(
                          hintText: TextManager.enterFoodName,
                          hasError: nameError,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        TextManager.description,
                        style: AppTypography.headerMedium,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        maxLines: null,
                        minLines: 3,
                        decoration: TextAreaDecoration(
                          hintText: TextManager.foodDescriptionHint,
                        ),
                      ),
                      const SizedBox(height: 24),
                      DurationSliderContainer(
                        value: sliderValue,
                        onChanged: onSliderValueChanged,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 56,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: PrimaryButton(
                onPressed: goToNextPage,
                text: TextManager.next,
              ),
            )
          ],
        ),
      ),
    );
  }
}
