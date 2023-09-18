import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        elevation: 0,
        onPressed: () {
          context.push(Routes.createPost);
        },
        highlightElevation: 0,
        child: const Icon(
          Icons.add_rounded,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: (value) => navigationShell.goBranch(value),
          currentIndex: navigationShell.currentIndex,
          unselectedItemColor: AppColors.secondaryText,
          selectedItemColor: AppColors.primary,
          unselectedLabelStyle: AppTypography.bodySmall,
          selectedLabelStyle: AppTypography.bodySmall,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home.path,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 0 ? AppColors.primary : AppColors.secondaryText,
                  BlendMode.srcIn,
                ),
              ),
              label: TextManager.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profile.path,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 1 ? AppColors.primary : AppColors.secondaryText,
                  BlendMode.srcIn,
                ),
              ),
              label: TextManager.profile,
            ),
          ],
        ),
      ),
    );
  }
}
