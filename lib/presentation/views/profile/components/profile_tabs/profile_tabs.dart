import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';

part 'parts/profile_tab_bar.dart';
part 'parts/profile_tab_bar_view.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    Key? key,
    required this.recipes,
    required this.liked,
  }) : super(key: key);

  final List<String> recipes, liked;

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
          ),
        ],
      ),
    );
  }
}
