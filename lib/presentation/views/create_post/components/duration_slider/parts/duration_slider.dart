part of '../duration_slider_container.dart';

class _DurationSlider extends StatelessWidget {
  const _DurationSlider({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final int value;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: Slider(
          value: value.toDouble(),
          onChanged: (value) => onChanged(value.toInt()),
          min: 1,
          max: 3,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.form,
        ),
      ),
    );
  }
}
