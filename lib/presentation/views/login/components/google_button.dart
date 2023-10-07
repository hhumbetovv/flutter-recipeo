import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/icons.dart';
import '../../../../constants/text_manager.dart';
import '../../../global/buttons/base_style.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
    this.isDisabled = false,
  }) : super(key: key);

  final bool isDisabled;

  void onPressed(BuildContext context) async {
    // AuthService authService = locator<AuthService>();
    // try {
    //   await authService.signInWithGoogle();
    // } on FirebaseAuthException catch (e) {
    //   if (context.mounted) showAppSnackBar(context, FirebaseFailures.getAuthFailure(e.code));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isDisabled ? null : () => onPressed(context),
      style: BaseButtonStyle(
        isCollabsed: false,
        border: AppColors.google,
        borderDisabled: AppColors.form,
        background: AppColors.google,
        backgroundDisabled: AppColors.form,
        overlay: AppColors.white,
      ),
      icon: SvgPicture.asset(AppIcons.google.path),
      label: Text(
        TextManager.google,
        style: TextStyle(
          fontSize: 15,
          height: 1.2,
          fontWeight: FontWeight.w700,
          color: isDisabled ? AppColors.secondaryText : AppColors.white,
        ),
      ),
    );
  }
}
