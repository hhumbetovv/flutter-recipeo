import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/text.manager.dart';
import 'router/app.router.dart';

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
        fontFamily: 'Inter',
        splashFactory: InkSparkle.splashFactory,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
