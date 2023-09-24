import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

part 'parts/food_type_radio.dart';

class FoodTypeSelection extends StatelessWidget {
  const FoodTypeSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _FoodTypeRadio(
            label: TextManager.food,
            value: FoodType.food,
          ),
          SizedBox(height: 8),
          _FoodTypeRadio(
            label: TextManager.drink,
            value: FoodType.drink,
          ),
        ],
      ),
    );
  }
}
