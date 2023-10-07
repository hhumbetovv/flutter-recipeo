import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../constants/routes.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import '../../../data/services/auth.service.dart';
import '../../../locator.dart';

part 'splash.state.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends _SplashState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        height: double.maxFinite,
        width: double.maxFinite,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [linearBegin, linearEnd],
          ),
        ),
        child: Text(
          TextManager.appTitle,
          style: AppTypography.headerLarge.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
