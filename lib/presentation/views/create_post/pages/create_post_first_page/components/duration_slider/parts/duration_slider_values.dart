part of '../duration_slider_container.dart';

class _DurationSliderValues extends StatelessWidget {
  const _DurationSliderValues({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreatePostCubit, CreatePostState, CookingDuration>(
      selector: (state) => state.cookingDuration,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: CookingDuration.values.map((cookingDuration) {
            return Text(
              cookingDuration.label,
              style: AppTypography.headerSmall.copyWith(
                color: state.sliderValue >= cookingDuration.sliderValue ? AppColors.primary : AppColors.secondaryText,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
