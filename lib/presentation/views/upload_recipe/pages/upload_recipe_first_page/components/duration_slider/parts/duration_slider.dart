part of '../duration_slider_container.dart';

class _DurationSlider extends StatefulWidget {
  const _DurationSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<_DurationSlider> createState() => _DurationSliderState();
}

class _DurationSliderState extends State<_DurationSlider> {
  late ValueNotifier<double> sliderValueNotifier;

  @override
  void initState() {
    super.initState();
    sliderValueNotifier = ValueNotifier(
      context.read<UploadRecipeCubit>().state.cookingDuration.sliderValue * 100,
    );
  }

  @override
  void dispose() {
    sliderValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0, elevation: 0),
        overlayColor: Colors.transparent,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: ValueListenableBuilder(
          valueListenable: sliderValueNotifier,
          builder: (context, sliderValue, child) {
            return Slider(
              value: sliderValue,
              onChangeEnd: (value) {
                context.read<UploadRecipeCubit>().onCookingDurationChanged((value / 100).round());
              },
              onChanged: (value) => sliderValueNotifier.value = value,
              divisions: 2,
              min: 100,
              max: 300,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.form,
            );
          },
        ),
      ),
    );
  }
}
