import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/field.error.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app.ink.well.dart';
import 'package:flutter_recipeo/presentation/global/inputs/base.decoration.dart';
import 'package:flutter_recipeo/utils/validation.util.dart';

part 'parts/obsecure.widget.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.passwordController,
    this.onValidate,
  }) : super(key: key);

  final TextEditingController passwordController;
  final ValueChanged<FieldError?>? onValidate;

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
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.primary,
      obscureText: obsecure,
      decoration: BaseInputDecoration(
        hintText: TextManager.passwordFieldHint,
        prefixIconPath: AppIcons.lock.path,
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
