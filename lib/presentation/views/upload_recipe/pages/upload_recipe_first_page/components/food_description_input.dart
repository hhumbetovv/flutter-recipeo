import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/food_type.dart';
import '../../../../../../constants/text_manager.dart';
import '../../../../../global/inputs/text_area_decoration.dart';
import '../../../cubit/upload_recipe_cubit.dart';

class FoodDescriptionInput extends StatelessWidget {
  const FoodDescriptionInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
      buildWhen: (previous, current) {
        return previous.foodType != current.foodType || previous.foodDescription != current.foodDescription;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.foodDescription,
          cursorColor: AppColors.primary,
          maxLines: null,
          minLines: 3,
          onChanged: (value) => context.read<UploadRecipeCubit>().onFoodDescriptionChanged(value),
          decoration: TextAreaDecoration(
            hintText:
                state.foodType == FoodType.food ? TextManager.foodDescriptionHint : TextManager.drinkDescriptionHint,
          ),
        );
      },
    );
  }
}
