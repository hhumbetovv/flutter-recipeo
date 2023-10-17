part of '../recipe_info.dart';

class _RecipeLikes extends StatelessWidget {
  const _RecipeLikes({
    Key? key,
    required this.isLoading,
    required this.likes,
  }) : super(key: key);

  final bool isLoading;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: isLoading
                ? const FittedBox(
                    child: Icon(
                      Icons.account_circle,
                      color: AppColors.mainText,
                    ),
                  )
                : FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: SvgPicture.asset(AppIcons.heartFilled.path),
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$likes Likes',
          style: AppTypography.headerSmall,
        ),
      ],
    );
  }
}
