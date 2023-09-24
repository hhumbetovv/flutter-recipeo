import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

class FoodNameLabel extends StatelessWidget {
  const FoodNameLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreatePostCubit, CreatePostState, FoodType>(
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
