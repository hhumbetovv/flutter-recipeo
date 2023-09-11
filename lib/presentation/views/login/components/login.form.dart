import 'package:flutter/material.dart';
import 'package:flutter_recipeo/presentation/global/inputs/email_field/email.field.dart';
import 'package:flutter_recipeo/presentation/global/inputs/password_field/password.field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.loginFormKey,
    required this.emailController,
    required this.passwordController,
    required this.emailHasError,
    required this.passwordHasError,
  }) : super(key: key);

  final GlobalKey<FormState> loginFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool emailHasError;
  final bool passwordHasError;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EmailField(
            emailController: emailController,
            hasError: emailHasError,
          ),
          const SizedBox(height: 16),
          PasswordField(
            passwordController: passwordController,
            hasError: passwordHasError,
          ),
          // SizedBox(height: 24),
          // Text(TextManager.forgotPassword, style: AppTypography.bodyMedium)
        ],
      ),
    );
  }
}
