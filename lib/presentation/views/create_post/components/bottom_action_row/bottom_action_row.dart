import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/food_type.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/presentation/dialogs/app_snackbar.dart';
import 'package:flutter_recipeo/presentation/dialogs/upload_post.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary_button.dart';
import 'package:flutter_recipeo/presentation/global/buttons/secondary_button/secondary_button.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

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
