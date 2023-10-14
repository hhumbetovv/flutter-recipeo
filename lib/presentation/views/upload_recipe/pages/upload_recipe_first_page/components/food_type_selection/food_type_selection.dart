import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constants/colors.dart';
import '../../../../../../../constants/food_type.dart';
import '../../../../../../../constants/text_manager.dart';
import '../../../../../../../constants/typography.dart';
import '../../../../../../global/app_ink_well.dart';
import '../../../../cubit/upload_recipe_cubit.dart';

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
