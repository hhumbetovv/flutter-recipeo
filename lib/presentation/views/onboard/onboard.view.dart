import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary.button.dart';
import 'package:go_router/go_router.dart';

import 'components/animated_image/animated.image.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntrinsicWidth(
          stepWidth: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const AnimatedImage(),
              const SizedBox(height: 48),
              const Text(
                TextManager.onboardTitle,
                style: AppTypography.headerLarge,
              ),
              const SizedBox(height: 16),
              Text(
                TextManager.onboardSubtitle,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(
                  onPressed: () => context.push(Routes.login),
                  text: TextManager.getStarted,
                ),
              ),
              const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }
}
