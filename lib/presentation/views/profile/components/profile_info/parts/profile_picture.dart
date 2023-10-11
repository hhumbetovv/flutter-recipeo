part of '../profile_info.dart';

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      clipBehavior: Clip.hardEdge,
      child: FractionallySizedBox(
        heightFactor: 1,
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
    );
  }
}
