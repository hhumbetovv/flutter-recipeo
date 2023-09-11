import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/inputs/email_field/email.field.dart';
import 'package:flutter_recipeo/presentation/global/inputs/password_field/password.field.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'parts/password.condition.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.registerFormKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> registerFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final List<Condition> conditions = [
      Condition(
        label: TextManager.lengthCondition,
        check: (String value) => value.length > 6,
      ),
      Condition(
        label: TextManager.containsNumber,
        check: (String value) => value.contains(RegExp(r'[0-9]')),
      ),
      Condition(
        label: TextManager.containsLetter,
        check: (String value) => value.contains(RegExp(r'[a-zA-Z]')),
      ),
    ];
    return Form(
      key: registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailField(
            emailController: emailController,
          ),
          const SizedBox(height: 16),
          PasswordField(
            passwordController: passwordController,
            onValidate: (value) {},
          ),
          const SizedBox(height: 24),
          const Text(TextManager.passwordMust, style: AppTypography.bodyLarge),
          for (var i = 0; i < conditions.length; i++) ...[
            const SizedBox(height: 16),
            _PasswordCondition(
              condition: conditions[i].label,
              isPassed: conditions[i].check(passwordController.text),
            ),
          ],
        ],
      ),
    );
  }
}

class Condition {
  final String label;
  final bool Function(String value) check;

  Condition({
    required this.label,
    required this.check,
  });
}
