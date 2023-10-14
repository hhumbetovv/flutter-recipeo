import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/food_type.dart';
import '../../../../../constants/text_manager.dart';
import '../../../../dialogs/app_snackbar.dart';
import '../../../../dialogs/upload_recipe.dart';
import '../../../../global/buttons/primary_button/primary_button.dart';
import '../../../../global/buttons/secondary_button/secondary_button.dart';
import '../../cubit/upload_recipe_cubit.dart';

part 'parts/back_button.dart';
part 'parts/next_button.dart';

class BottomActionRow extends StatelessWidget {
  const BottomActionRow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          _BackButton(controller: controller),
          _NextButton(controller: controller),
        ],
      ),
    );
  }
}
