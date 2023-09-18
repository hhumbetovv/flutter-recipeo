import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';

part 'parts/duration_slider.dart';
part 'parts/duration_slider_title.dart';
part 'parts/duration_slider_values.dart';

class DurationSliderContainer extends StatelessWidget {
  const DurationSliderContainer({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DurationSliderTitle(),
        const SizedBox(height: 16),
        _DurationSliderValues(
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
        _DurationSlider(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
