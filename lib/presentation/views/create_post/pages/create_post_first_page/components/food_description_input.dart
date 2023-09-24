import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/presentation/global/inputs/text_area_decoration.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

class FoodDescriptionInput extends StatelessWidget {
  const FoodDescriptionInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      buildWhen: (previous, current) {
        return previous.foodType != current.foodType || previous.foodDescription != current.foodDescription;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.foodDescription,
          cursorColor: AppColors.primary,
          maxLines: null,
          minLines: 3,
          onChanged: (value) => context.read<CreatePostCubit>().onFoodDescriptionChanged(value),
          decoration: TextAreaDecoration(
            hintText:
                state.foodType == FoodType.food ? TextManager.foodDescriptionHint : TextManager.drinkDescriptionHint,
          ),
        );
      },
    );
  }
}
