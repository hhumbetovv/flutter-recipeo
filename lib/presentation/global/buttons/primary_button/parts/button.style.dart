part of '../primary.button.dart';

class _ButtonStyle extends BaseButtonStyle {
  _ButtonStyle(
    bool isOutlined,
    bool isCollabsed,
  ) : super(
          isCollabsed: isCollabsed,
          border: AppColors.primary,
          borderDisabled: isOutlined ? AppColors.outline : AppColors.form,
          background: isOutlined ? AppColors.white : AppColors.primary,
          backgroundDisabled: isOutlined ? AppColors.white : AppColors.form,
          overlay: isOutlined ? AppColors.primary : AppColors.white,
        );
}
