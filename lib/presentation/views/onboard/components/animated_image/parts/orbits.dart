part of '../animated.image.dart';

class Orbits extends StatefulWidget {
  const Orbits({
    Key? key,
    required this.centerKey,
  }) : super(key: key);

  final GlobalKey centerKey;

  @override
  State<Orbits> createState() => _OrbitsState();
}

class _OrbitsState extends State<Orbits> {
  final double radius = 160.0;
  bool isCallBackExecuted = false;

  late final RenderBox renderBox;
  late double centerX;
  late double centerY;
  final List<double> radiusList = [57, 36, 46, 36, 57, 44, 36];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = widget.centerKey.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        centerX = renderBox.size.width / 2;
        centerY = renderBox.size.height / 2;
        isCallBackExecuted = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (isCallBackExecuted)
          ...List.generate(7, (index) {
            final double angle = 2 * pi * (index / 7);
            final double x = centerX + radius * cos(angle);
            final double y = centerY + radius * sin(angle);
            return Positioned(
              left: x - radiusList[index],
              top: y - radiusList[index],
              child: _OrbitAvatar(
                imagePath: AppImages.orbit.at(index + 1),
                radius: radiusList[index],
              ),
            );
          })
      ],
    );
  }
}
