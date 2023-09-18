part of '../food_type_selection.dart';

class _FoodTypeRadio extends StatelessWidget {
  const _FoodTypeRadio({
    Key? key,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
  }) : super(key: key);

  final String label;
  final FoodType value;
  final FoodType selectedValue;
  final ValueChanged<FoodType?> onSelected;
  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => onSelected(value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Radio(
            activeColor: AppColors.primary,
            value: value,
            groupValue: selectedValue,
            onChanged: onSelected,
          ),
          Text(
            label,
            style: AppTypography.headerSmall,
          )
        ],
      ),
    );
  }
}
