import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../views/create_post/create_post.view.dart';
import '../views/create_profile/create_profile.view.dart';
import '../views/login/login.view.dart';
import '../views/onboard/onboard.view.dart';
import '../views/register/register.view.dart';
import '../views/splash/splash.view.dart';
import '../wrappers/main_wrapper.dart';
import 'branches/home_branch.dart';
import 'branches/profile_branch.dart';
import 'transitions.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: _rootNavigatorKey,
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
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) => MainWrapper(navigationShell: navigationShell),
        pageBuilder: (context, state, navigationShell) {
          return CupertinoTransition(
            MainWrapper(
              navigationShell: navigationShell,
            ),
          );
        },
        branches: [
          HomeBranch(),
          ProfileBranch(),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.createPost,
        pageBuilder: (context, state) => DownToUpTransition(const CreatePostView()),
      ),
    ],
  );
}
