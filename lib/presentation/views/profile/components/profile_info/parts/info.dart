part of '../profile_info.dart';

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value, style: AppTypography.headerMedium),
          const SizedBox(height: 3),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.secondaryText,
            ),
          )
        ],
      ),
    );
  }
}
