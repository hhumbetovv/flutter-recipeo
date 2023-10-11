part of '../profile_info.dart';

class _UserName extends StatelessWidget {
  const _UserName({
    Key? key,
    required this.displayName,
  }) : super(key: key);

  final String displayName;

  @override
  Widget build(BuildContext context) {
    return Text(
      displayName,
      style: AppTypography.headerMedium,
      textAlign: TextAlign.center,
    );
  }
}
