import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
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
        )
      ],
    );
  }
}
