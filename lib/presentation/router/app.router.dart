import 'package:flutter/cupertino.dart';
import 'package:flutter_recipeo/presentation/views/login/login.view.dart';
import 'package:flutter_recipeo/presentation/views/sign_up/sign.up.view.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../views/onboard/onboard.view.dart';
import '../views/splash/splash.view.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.onboard,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.onboard,
        builder: (context, state) => const OnBoardView(),
        pageBuilder: (context, state) => CupertinoTransition(const OnBoardView()),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginView(),
        pageBuilder: (context, state) => CupertinoTransition(const LoginView()),
      ),
      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => const SignUpView(),
        pageBuilder: (context, state) => CupertinoTransition(const SignUpView()),
      ),
    ],
  );
}

class CupertinoTransition extends CustomTransitionPage {
  CupertinoTransition(passedChild)
      : super(
          child: passedChild,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return CupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              linearTransition: false,
              child: child,
            );
          },
        );
}
