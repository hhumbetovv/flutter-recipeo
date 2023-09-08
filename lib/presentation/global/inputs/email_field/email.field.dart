import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/field.error.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base.decoration.dart';
import 'package:flutter_recipeo/utils/validation.util.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.emailController,
    this.onValidate,
  }) : super(key: key);

  final TextEditingController emailController;
  final ValueChanged<FieldError?>? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.next,
      validator: (String? value) {
        final FieldError? fieldError = ValidationUtil.checkEmail(value);
        if (onValidate != null) onValidate!(fieldError);
        return fieldError?.name;
      },
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.primary,
      decoration: BaseInputDecoration(
        hintText: TextManager.emailFieldHint,
        prefixIconPath: AppIcons.message.path,
      ),
      style: AppTypography.bodyMedium,
    );
  }
}
