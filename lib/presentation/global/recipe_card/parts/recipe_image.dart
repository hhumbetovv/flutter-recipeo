part of '../recipe_card.dart';

class _RecipeImage extends StatelessWidget {
  const _RecipeImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.hardEdge,
        child: Skeleton.shade(
          child: ColoredBox(
            color: AppColors.white,
            child: image != null ? CachedNetworkImage(imageUrl: image!) : null,
          ),
        ),
      ),
    );
  }
}
