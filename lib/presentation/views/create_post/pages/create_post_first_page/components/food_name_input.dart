import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base_decoration.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

class FoodNameInput extends StatelessWidget {
  const FoodNameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      buildWhen: (previous, current) {
        return previous.foodType != current.foodType ||
            previous.foodName != current.foodName ||
            previous.nameError != current.nameError;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.foodName,
          cursorColor: state.nameError ? AppColors.secondary : AppColors.primary,
          onChanged: (value) => context.read<CreatePostCubit>().onFoodNameChanged(value),
          decoration: BaseInputDecoration(
            hintText: state.foodType == FoodType.food ? TextManager.enterFoodName : TextManager.enterDrinkName,
            hasError: state.nameError,
          ),
        );
      },
    );
  }
}
