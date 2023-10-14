import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/food_type.dart';
import '../../../../../../constants/text_manager.dart';
import '../../../../../global/inputs/base_decoration.dart';
import '../../../cubit/upload_recipe_cubit.dart';

class FoodNameInput extends StatelessWidget {
  const FoodNameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
      buildWhen: (previous, current) {
        return previous.foodType != current.foodType ||
            previous.foodName != current.foodName ||
            previous.nameError != current.nameError;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.foodName,
          cursorColor: state.nameError ? AppColors.secondary : AppColors.primary,
          onChanged: (value) => context.read<UploadRecipeCubit>().onFoodNameChanged(value),
          decoration: BaseInputDecoration(
            hintText: state.foodType == FoodType.food ? TextManager.enterFoodName : TextManager.enterDrinkName,
            hasError: state.nameError,
          ),
        );
      },
    );
  }
}
