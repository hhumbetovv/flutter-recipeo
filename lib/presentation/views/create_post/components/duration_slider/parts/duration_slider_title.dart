part of '../duration_slider_container.dart';

class _DurationSliderTitle extends StatelessWidget {
  const _DurationSliderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: TextManager.cookingDuration,
            style: AppTypography.headerMedium,
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: TextManager.inMinutes,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
