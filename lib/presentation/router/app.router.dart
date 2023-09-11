import 'package:flutter/cupertino.dart';
import 'package:flutter_recipeo/presentation/router/home.branch.dart';
import 'package:flutter_recipeo/presentation/router/transitions.dart';
import 'package:flutter_recipeo/presentation/router/upload.branch.dart';
import 'package:flutter_recipeo/presentation/views/create_profile/create.profile.view.dart';
import 'package:flutter_recipeo/presentation/views/login/login.view.dart';
import 'package:flutter_recipeo/presentation/views/main_wrapper/main.wrapper.view.dart';
import 'package:flutter_recipeo/presentation/views/register/register.view.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../views/onboard/onboard.view.dart';
import '../views/splash/splash.view.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: _rootKey,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.onboard,
        pageBuilder: (context, state) => CupertinoTransition(const OnBoardView()),
      ),
      GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => CupertinoTransition(const LoginView()),
      ),
      GoRoute(
        path: Routes.register,
        pageBuilder: (context, state) => CupertinoTransition(const RegisterView()),
      ),
      GoRoute(
        path: Routes.createProfile,
        pageBuilder: (context, state) => CupertinoTransition(const CreateProfileView()),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return CupertinoTransition(
            MainWrapper(navigationShell: navigationShell),
          );
        },
        branches: [
          HomeBranch(),
          ProfileBranch(),
        ],
      )
    ],
  );
}
