import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/food_type.dart';
import '../../../../../../constants/text_manager.dart';
import '../../../../../../constants/typography.dart';
import '../../../cubit/upload_recipe_cubit.dart';

class FoodNameLabel extends StatelessWidget {
  const FoodNameLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UploadRecipeCubit, UploadRecipeState, FoodType>(
      selector: (state) => state.foodType,
      builder: (context, state) {
        return Text(
          state == FoodType.food ? TextManager.foodName : TextManager.drinkName,
          style: AppTypography.headerMedium,
        );
      },
    );
  }
}
