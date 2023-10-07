import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../constants/routes.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import '../../../data/failures/firebase_failures.dart';
import '../../../data/services/auth.service.dart';
import '../../../locator.dart';
import '../../../mixins/loading.state.dart';
import '../../dialogs/app_snackbar.dart';
import '../../global/buttons/primary_button/primary_button.dart';
import 'components/login_form.dart';
import 'components/sign_up_info.dart';

part 'login.state.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends _LoginState {
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
                  emailHasError: emailHasError,
                  passwordHasError: passwordHasError,
                ),
                const SizedBox(height: 72),
                PrimaryButton(
                  onPressed: isLoading ? null : onFormSubmit,
                  text: TextManager.login,
                ),
                const SizedBox(height: 24),
                // Text(
                //   TextManager.continueWith,
                //   style: AppTypography.bodyMedium.copyWith(
                //     color: AppColors.secondaryText,
                //   ),
                // ),
                // const SizedBox(height: 24),
                // GoogleButton(
                //   isDisabled: isLoading,
                // ),
                // const SizedBox(height: 24),
                const SignUpInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
