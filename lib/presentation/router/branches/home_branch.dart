import 'package:flutter/material.dart';
import 'package:flutter_recipeo/data/models/recipe_model.dart';
import 'package:flutter_recipeo/presentation/views/recipe_details/recipe_details.view.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/routes.dart';
import '../../views/home/home.view.dart';
import '../transitions.dart';

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
