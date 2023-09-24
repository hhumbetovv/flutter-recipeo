import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/cooking_duration.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

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
