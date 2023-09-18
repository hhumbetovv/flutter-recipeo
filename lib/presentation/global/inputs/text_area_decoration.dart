import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/typography.dart';

class TextAreaDecoration extends InputDecoration {
  static OutlineInputBorder _inputBorder(Color color, [double? width]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
        width: width ?? 1,
      ),
    );
  }

  TextAreaDecoration({
    String? hintText,
  }) : super(
          errorStyle: const TextStyle(height: 0.01, fontSize: 0),
          errorMaxLines: 1,
          hintText: hintText,
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText),
          contentPadding: const EdgeInsets.all(16),
          isDense: true,
          suffixIconColor: AppColors.secondaryText,
          border: _inputBorder(AppColors.outline),
          enabledBorder: _inputBorder(AppColors.outline),
          focusedBorder: _inputBorder(AppColors.primary, 2),
          errorBorder: _inputBorder(AppColors.secondary, 2),
          // suffixIcon: suffixIcon,
          // prefixIcon: prefixIconPath != null
          //     ? Padding(
          //         padding: const EdgeInsets.only(left: 24, right: 10),
          //         child: SvgPicture.asset(
          //           prefixIconPath,
          //           height: 24,
          //           width: 24,
          //         ),
          //       )
          //     : null,
        );
}
