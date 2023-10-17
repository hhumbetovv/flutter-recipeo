part of '../recipe_info.dart';

class _RecipeTypeAndInfo extends StatelessWidget {
  const _RecipeTypeAndInfo({
    Key? key,
    required this.type,
    required this.duration,
  }) : super(key: key);

  final FoodType type;
  final CookingDuration duration;

  String get _type => type == FoodType.food ? TextManager.food : TextManager.drink;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_type • ${duration.label}',
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.secondaryText,
      ),
    );
  }
}
