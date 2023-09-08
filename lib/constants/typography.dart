import 'package:flutter/material.dart';

import 'colors.dart';

sealed class AppTypography {
  static const TextStyle headerLarge = TextStyle(
    color: AppColors.mainText,
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 1.45,
  );

  static const TextStyle headerMedium = TextStyle(
    color: AppColors.mainText,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 1.58,
  );

  static const TextStyle headerSmall = TextStyle(
    color: AppColors.mainText,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1.66,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.mainText,
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 1.58,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.mainText,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.66,
  );

  static const TextStyle bodySmall = TextStyle(
    color: AppColors.mainText,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.25,
  );
}
