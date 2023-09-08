import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../constants/routes.dart';
import 'splash.view.dart';

mixin SplashMixin on State<SplashView> {
  Color linearBegin = Colors.white;
  final Color linearEnd = Colors.white;

  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        linearBegin = AppColors.primary;
      });
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) context.go(Routes.onboard);
  }
}
