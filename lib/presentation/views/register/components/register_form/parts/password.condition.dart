part of '../register.form.dart';

class _PasswordCondition extends StatelessWidget {
  const _PasswordCondition({
    Key? key,
    required this.condition,
    required this.isPassed,
  }) : super(key: key);

  final String condition;
  final bool isPassed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: isPassed ? AppColors.primaryAccent : AppColors.form,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppIcons.check.path,
            colorFilter: ColorFilter.mode(
              isPassed ? AppColors.primary : AppColors.secondaryText,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          condition,
          style: AppTypography.bodyMedium.copyWith(
            color: isPassed ? AppColors.mainText : AppColors.secondaryText,
          ),
        )
      ],
    );
  }
}
