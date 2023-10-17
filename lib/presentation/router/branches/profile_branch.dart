import 'package:flutter/material.dart';
import 'package:flutter_recipeo/data/models/recipe_model.dart';
import 'package:flutter_recipeo/presentation/views/recipe_details/recipe_details.view.dart';
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
              pageBuilder: (context, state) => CupertinoTransition(ProfileView(uid: state.extra as String?)),
            ),
            GoRoute(
              path: Routes.recipeDetails,
              pageBuilder: (context, state) {
                return CupertinoTransition(RecipeDetailsView(
                  recipe: RecipeModel.fromJson(state.extra as Map<String, dynamic>),
                ));
              },
            ),
          ],
        );
}
