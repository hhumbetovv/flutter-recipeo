import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/typography.dart';

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.mainText,
      content: Text(
        message,
        style: AppTypography.bodyMedium.copyWith(color: AppColors.secondary),
      ),
    ),
  );
}
