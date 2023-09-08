import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary.button.dart';
import 'package:flutter_recipeo/presentation/views/sign_up/components/sign_up_form/sign.up.form.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void onFormSubmit() {
    if (signUpFormKey.currentState!.validate()) {
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
              const Text(TextManager.welcome, style: AppTypography.headerLarge),
              const SizedBox(height: 8),
              Text(
                TextManager.enterAccount,
                style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText),
              ),
              const SizedBox(height: 32),
              SignUpForm(
                signUpFormKey: signUpFormKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 72),
              PrimaryButton(
                onPressed: onFormSubmit,
                text: TextManager.signUp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
