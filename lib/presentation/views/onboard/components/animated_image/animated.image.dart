import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/images.dart';

part 'parts/orbit.avatar.dart';
part 'parts/orbits.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with TickerProviderStateMixin {
  final GlobalKey centerKey = GlobalKey();
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat(); // Sonsuz döngü için animasyonu tekrarlatır.
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            key: centerKey,
            width: double.maxFinite,
            height: double.maxFinite,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: _OrbitAvatar(
                imagePath: AppImages.orbitCenter.jpg,
                radius: 80,
              ),
            ),
          ),
          RotationTransition(
            turns: _controller,
            child: Orbits(centerKey: centerKey),
          ),
        ],
      ),
    );
  }
}
