import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:go_router/go_router.dart';

class SignUpInfo extends StatelessWidget {
  const SignUpInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TextManager.dontHaveAccount,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.mainText,
          ),
        ),
        const SizedBox(width: 8),
        AppInkWell(
          onTap: () {
            context.push(Routes.register);
          },
          child: Text(
            TextManager.signUp,
            style: AppTypography.headerSmall.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
