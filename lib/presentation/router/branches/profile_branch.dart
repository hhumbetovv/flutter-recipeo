import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/routes.dart';
import '../../views/profile/profile.view.dart';
import '../transitions.dart';

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
