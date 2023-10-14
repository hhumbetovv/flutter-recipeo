import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_manager.dart';
import '../../../../../constants/typography.dart';
import '../../../../global/recipe_list.dart';

part 'parts/profile_tab_bar.dart';
part 'parts/profile_tab_bar_view.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    Key? key,
    required this.recipes,
    required this.liked,
    required this.profileLoading,
  }) : super(key: key);

  final List<String> recipes, liked;
  final bool profileLoading;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          const _ProfileTabBar(),
          _ProfileTabBarView(
            recipes: recipes,
            liked: liked,
            profileIsLoading: profileLoading,
          ),
        ],
      ),
    );
  }
}
