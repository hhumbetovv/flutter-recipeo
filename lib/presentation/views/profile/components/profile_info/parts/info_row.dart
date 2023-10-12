part of '../profile_info.dart';

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    Key? key,
    required this.recipes,
    required this.following,
    required this.followers,
  }) : super(key: key);

  final int recipes;
  final List<String> following, followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Info(
          label: TextManager.recipes,
          value: '$recipes',
        ),
        _Info(
          label: TextManager.following,
          value: '${following.length}',
        ),
        _Info(
          label: TextManager.followers,
          value: '${followers.length}',
        ),
      ],
    );
  }
}
