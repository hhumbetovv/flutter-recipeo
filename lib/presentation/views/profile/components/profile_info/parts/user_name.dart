part of '../profile_info.dart';

class _UserName extends StatelessWidget {
  const _UserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Fallen Angel',
      style: AppTypography.headerMedium,
      textAlign: TextAlign.center,
    );
  }
}
