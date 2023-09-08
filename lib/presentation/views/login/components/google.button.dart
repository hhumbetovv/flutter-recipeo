import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/presentation/global/buttons/base.style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
    this.isDisabled = false,
  }) : super(key: key);

  final bool isDisabled;

  void onPressed() {
    // TODO: Implement Login with Google
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
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
