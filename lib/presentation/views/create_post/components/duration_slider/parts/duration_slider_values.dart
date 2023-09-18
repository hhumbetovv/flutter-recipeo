part of '../duration_slider_container.dart';

class _DurationSliderValues extends StatelessWidget {
  const _DurationSliderValues({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppInkWell(
          onTap: () => onChanged(1),
          child: Text(
            '<10',
            style: AppTypography.headerSmall.copyWith(
              color: value >= 1 ? AppColors.primary : AppColors.secondaryText,
            ),
          ),
        ),
        AppInkWell(
          onTap: () => onChanged(2),
          child: Text(
            '30',
            style: AppTypography.headerSmall.copyWith(
              color: value >= 2 ? AppColors.primary : AppColors.secondaryText,
            ),
          ),
        ),
        AppInkWell(
          onTap: () => onChanged(3),
          child: Text(
            '>60',
            style: AppTypography.headerSmall.copyWith(
              color: value == 3 ? AppColors.primary : AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
