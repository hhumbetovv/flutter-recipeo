part of '../profile_tabs.dart';

class _ProfileTabBar extends StatelessWidget {
  const _ProfileTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorWeight: 3,
      physics: BouncingScrollPhysics(),
      labelStyle: AppTypography.headerSmall,
      labelColor: AppColors.main,
      unselectedLabelColor: AppColors.secondaryText,
      indicatorColor: AppColors.primary,
      tabs: <Widget>[
        Tab(text: TextManager.recipes),
        Tab(text: TextManager.liked),
      ],
    );
  }
}
