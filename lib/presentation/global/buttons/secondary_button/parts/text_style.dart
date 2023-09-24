part of '../secondary_button.dart';

class _TextStyle extends TextStyle {
  const _TextStyle(
    bool isDisabled,
  ) : super(
          fontSize: 15,
          height: 1.2,
          fontWeight: FontWeight.w700,
          color: isDisabled ? AppColors.secondaryText : AppColors.main,
        );
}
