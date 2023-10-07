import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import 'base_decoration.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    required this.nameController,
    this.hasError = false,
  }) : super(key: key);

  final TextEditingController nameController;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: hasError ? AppColors.secondary : AppColors.primary,
      decoration: BaseInputDecoration(
        hintText: TextManager.nameFieldHint,
        hasError: hasError,
      ),
      style: AppTypography.bodyMedium,
    );
  }
}
