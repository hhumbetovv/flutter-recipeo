part of '../steps_container.dart';

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      TextManager.steps,
      style: AppTypography.headerMedium,
    );
  }
}
