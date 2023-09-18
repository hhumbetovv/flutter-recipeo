import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/typography.dart';

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
