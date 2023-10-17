part of '../recipe_info.dart';

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    Key? key,
    required this.image,
    required this.displayName,
    required this.uid,
  }) : super(key: key);

  final String? image;
  final String? displayName;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () {
        context.push(Routes.profile, extra: uid);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            height: 32,
            width: 32,
            child: image == null
                ? const FittedBox(
                    child: Icon(
                      Icons.account_circle,
                      color: AppColors.mainText,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: image!,
                  ),
          ),
          const SizedBox(width: 8),
          Text(
            displayName ?? TextManager.unknown,
            style: AppTypography.headerSmall,
          ),
        ],
      ),
    );
  }
}
