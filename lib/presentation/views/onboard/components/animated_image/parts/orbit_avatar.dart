part of '../animated_image.dart';

class _OrbitAvatar extends StatelessWidget {
  const _OrbitAvatar({
    Key? key,
    required this.imagePath,
    required this.radius,
  }) : super(key: key);

  final String imagePath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0B2C66).withOpacity(0.16),
            blurRadius: 24,
            offset: const Offset(8, 8),
          )
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: radius - 8,
          foregroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}
