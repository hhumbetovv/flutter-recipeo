part of '../recipe_card.dart';

class _RecipeInfo extends StatelessWidget {
  const _RecipeInfo({
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
      style: AppTypography.bodySmall.copyWith(color: AppColors.secondaryText),
    );
  }
}
