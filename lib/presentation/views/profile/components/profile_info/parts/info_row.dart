part of '../profile_info.dart';

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Info(
          label: 'Recipes',
          value: '32',
        ),
        _Info(
          label: 'Following',
          value: '787',
        ),
        _Info(
          label: 'Followers',
          value: '1.278',
        ),
      ],
    );
  }
}
