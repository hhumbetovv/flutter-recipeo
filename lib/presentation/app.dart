import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_recipeo/constants/colors.dart';

import '../constants/text_manager.dart';
import 'router/app_router.dart';

class RecipeoApp extends StatelessWidget {
  const RecipeoApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      title: TextManager.appTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        fontFamily: 'Inter',
        splashFactory: InkSparkle.splashFactory,
        scaffoldBackgroundColor: AppColors.white,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
