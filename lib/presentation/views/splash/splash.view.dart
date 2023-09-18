import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/data/models/user_model.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';

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
