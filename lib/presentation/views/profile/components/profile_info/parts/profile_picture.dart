part of '../profile_info.dart';

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50.0,
      backgroundImage: CachedNetworkImageProvider(
        'https://picsum.photos/1000',
      ),
    );
  }
}
