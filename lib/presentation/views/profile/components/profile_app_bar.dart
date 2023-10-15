import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/routes.dart';
import '../../../../data/services/auth.service.dart';
import '../../../../locator.dart';
import '../../../dialogs/app_snackbar.dart';
import '../../../global/app_ink_well.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: isLoading,
      child: SliverAppBar(
        backgroundColor: AppColors.white,
        pinned: true,
        // leading: GestureDetector(
        //   onTap: () {},
        //   child: SvgPicture.asset(
        //     AppIcons.arrowLeft.path,
        //     fit: BoxFit.scaleDown,
        //   ),
        // ),
        actions: [
          AppInkWell(
            onTap: () {},
            child: const AspectRatio(
              aspectRatio: 1,
              child: Icon(
                Icons.settings_outlined,
                color: AppColors.main,
              ),
            ),
          ),
          AppInkWell(
            onTap: () async {
              try {
                final AuthService authService = locator<AuthService>();
                await authService.logout();
                if (context.mounted) context.go(Routes.onboard);
              } catch (e) {
                if (context.mounted) showAppSnackBar(context, e.toString());
              }
            },
            child: const AspectRatio(
              aspectRatio: 1,
              child: Icon(
                Icons.logout_outlined,
                color: AppColors.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
