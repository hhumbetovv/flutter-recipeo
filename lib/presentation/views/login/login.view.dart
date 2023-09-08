import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary.button.dart';
import 'package:flutter_recipeo/presentation/views/login/components/google.button.dart';
import 'package:flutter_recipeo/presentation/views/login/components/login.form.dart';
import 'package:flutter_recipeo/presentation/views/login/components/sign.up.info.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void onFormSubmit() {
    if (loginFormKey.currentState!.validate()) {
      debugPrint('validated');
      // TODO: Implement Login Functionality
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(TextManager.welcomeBack, style: AppTypography.headerLarge),
              const SizedBox(height: 8),
              Text(
                TextManager.enterAccount,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 32),
              LoginForm(
                loginFormKey: loginFormKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 72),
              PrimaryButton(
                onPressed: onFormSubmit,
                text: TextManager.login,
              ),
              const SizedBox(height: 24),
              Text(
                TextManager.continueWith,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 24),
              const GoogleButton(),
              const SizedBox(height: 24),
              const SignUpInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
