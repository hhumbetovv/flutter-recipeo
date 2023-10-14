part of '../recipe_card.dart';

class _FoodName extends StatelessWidget {
  const _FoodName({
    Key? key,
    required this.foodName,
  }) : super(key: key);

  final String? foodName;

  @override
  Widget build(BuildContext context) {
    return Text(
      foodName ?? TextManager.unknown,
      overflow: TextOverflow.ellipsis,
      style: AppTypography.headerMedium,
    );
  }
}
