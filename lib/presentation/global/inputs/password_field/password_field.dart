import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/field_error.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base_decoration.dart';
import 'package:flutter_recipeo/utils/validation_util.dart';

part 'parts/obsecure_widget.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.passwordController,
    this.onValidate,
    this.hasError = false,
  }) : super(key: key);

  final TextEditingController passwordController;
  final ValueChanged<FieldError?>? onValidate;
  final bool hasError;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      validator: (String? value) {
        final FieldError? fieldError = ValidationUtil.checkPassword(value);
        if (widget.onValidate != null) widget.onValidate!(fieldError);
        return fieldError?.name;
      },
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      textAlignVertical: TextAlignVertical.center,
      cursorColor: widget.hasError ? AppColors.secondary : AppColors.primary,
      obscureText: obsecure,
      decoration: BaseInputDecoration(
        hintText: TextManager.passwordFieldHint,
        prefixIconPath: AppIcons.lock.path,
        hasError: widget.hasError,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 24),
          child: _ObsecureWidget(
            value: obsecure,
            onChanged: (value) => setState(() {
              obsecure = value;
            }),
          ),
        ),
      ),
      style: AppTypography.bodyMedium,
    );
  }
}
