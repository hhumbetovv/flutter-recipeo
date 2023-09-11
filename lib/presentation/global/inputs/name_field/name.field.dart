import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base.decoration.dart';

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
