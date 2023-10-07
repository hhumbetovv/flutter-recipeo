import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';
import '../../../constants/field_error.dart';
import '../../../constants/icons.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import '../../../utils/validation_util.dart';
import 'base_decoration.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.emailController,
    this.onValidate,
    this.hasError = false,
  }) : super(key: key);

  final TextEditingController emailController;
  final ValueChanged<FieldError?>? onValidate;
  final bool hasError;

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
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      textAlignVertical: TextAlignVertical.center,
      cursorColor: hasError ? AppColors.secondary : AppColors.primary,
      decoration: BaseInputDecoration(
        hintText: TextManager.emailFieldHint,
        prefixIconPath: AppIcons.message.path,
        hasError: hasError,
      ),
      style: AppTypography.bodyMedium,
    );
  }
}
