import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:go_router/go_router.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppInkWell(
            onTap: () => context.pop(),
            child: Text(
              TextManager.cancel,
              style: AppTypography.headerMedium.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          const Text(
            '1/2',
            style: AppTypography.headerMedium,
          ),
        ],
      ),
    );
  }
}
