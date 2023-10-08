import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';

part 'parts/profile_tab_bar.dart';
part 'parts/profile_tab_bar_view.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Column(
        children: [
          SizedBox(height: kToolbarHeight),
          _ProfileTabBar(),
          _ProfileTabBarView(),
        ],
      ),
    );
  }
}
