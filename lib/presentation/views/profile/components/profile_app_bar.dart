import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:flutter_recipeo/presentation/dialogs/app_snackbar.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:go_router/go_router.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}
