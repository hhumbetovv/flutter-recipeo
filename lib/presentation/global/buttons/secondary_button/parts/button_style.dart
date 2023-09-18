part of '../secondary_button.dart';

class _ButtonStyle extends BaseButtonStyle {
  _ButtonStyle(
    bool isOutlined,
    bool isCollabsed,
  ) : super(
          isCollabsed: isCollabsed,
          border: isOutlined ? AppColors.outline : AppColors.form,
          background: isOutlined ? AppColors.white : AppColors.form,
          overlay: AppColors.secondaryText,
        );
}
