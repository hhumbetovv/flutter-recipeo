import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';

part 'parts/food_type_radio.dart';

class FoodTypeSelection extends StatelessWidget {
  const FoodTypeSelection({
    Key? key,
    required this.value,
    required this.onSelectionChanged,
  }) : super(key: key);

  final FoodType value;
  final ValueChanged<FoodType?> onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory, highlightColor: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _FoodTypeRadio(
              label: TextManager.food,
              value: FoodType.food,
              selectedValue: value,
              onSelected: onSelectionChanged,
            ),
            const SizedBox(height: 8),
            _FoodTypeRadio(
              label: TextManager.drink,
              value: FoodType.drink,
              selectedValue: value,
              onSelected: onSelectionChanged,
            ),
          ],
        ),
      ),
    );
  }
}
