import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/presentation/router/transitions.dart';
import 'package:flutter_recipeo/presentation/views/profile/profile.view.dart';
import 'package:go_router/go_router.dart';

class ProfileBranch extends StatefulShellBranch {
  static final GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey<NavigatorState>();
  ProfileBranch()
      : super(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.profile,
              pageBuilder: (context, state) => CupertinoTransition(const ProfileView()),
            ),
          ],
        );
}
