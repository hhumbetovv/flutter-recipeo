import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/data/failures/auth_failures.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:flutter_recipeo/mixins/loading.state.dart';
import 'package:flutter_recipeo/presentation/dialogs/app.snackbar.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary.button.dart';
import 'package:flutter_recipeo/presentation/views/register/components/register_form/register.form.dart';
import 'package:go_router/go_router.dart';

part 'register.state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: IgnorePointer(
            ignoring: isLoading,
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
                RegisterForm(
                  registerFormKey: registerFormKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 72),
                PrimaryButton(
                  onPressed: isLoading ? null : onFormSubmit,
                  text: TextManager.signUp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
