import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/presentation/router/transitions.dart';
import 'package:flutter_recipeo/presentation/views/home/home.view.dart';
import 'package:go_router/go_router.dart';

class HomeBranch extends StatefulShellBranch {
  static final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
  HomeBranch()
      : super(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.home,
              pageBuilder: (context, state) => CupertinoTransition(const HomeView()),
            ),
          ],
        );
}
