import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseInputDecoration extends InputDecoration {
  static OutlineInputBorder _inputBorder(Color color, [double? width]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(
        color: color,
        width: width ?? 1,
      ),
    );
  }

  BaseInputDecoration({
    String? hintText,
    String? prefixIconPath,
    bool hasError = false,
    Widget? suffixIcon,
  }) : super(
          fillColor: AppColors.white,
          filled: true,
          errorStyle: const TextStyle(height: 0.01, fontSize: 0),
          errorMaxLines: 1,
          hintText: hintText,
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          isDense: true,
          suffixIconColor: AppColors.secondaryText,
          border: hasError ? _inputBorder(AppColors.secondary, 2) : _inputBorder(AppColors.outline),
          enabledBorder: hasError ? _inputBorder(AppColors.secondary, 2) : _inputBorder(AppColors.outline),
          focusedBorder: hasError ? _inputBorder(AppColors.secondary, 2) : _inputBorder(AppColors.primary, 2),
          errorBorder: _inputBorder(AppColors.secondary, 2),
          focusColor: hasError ? AppColors.secondary : AppColors.primary,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIconPath != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 24, right: 10),
                  child: SvgPicture.asset(
                    prefixIconPath,
                    height: 24,
                    width: 24,
                  ),
                )
              : null,
        );
}
