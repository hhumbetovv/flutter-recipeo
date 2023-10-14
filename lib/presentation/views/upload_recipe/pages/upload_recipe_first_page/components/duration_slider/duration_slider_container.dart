import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constants/colors.dart';
import '../../../../../../../constants/cooking_duration.dart';
import '../../../../../../../constants/text_manager.dart';
import '../../../../../../../constants/typography.dart';
import '../../../../cubit/upload_recipe_cubit.dart';

part 'parts/duration_slider.dart';
part 'parts/duration_slider_title.dart';
part 'parts/duration_slider_values.dart';

class DurationSliderContainer extends StatelessWidget {
  const DurationSliderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DurationSliderTitle(),
        SizedBox(height: 16),
        _DurationSliderValues(),
        SizedBox(height: 10),
        _DurationSlider(),
      ],
    );
  }
}
