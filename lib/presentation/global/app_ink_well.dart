import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    Key? key,
    required this.child,
    this.onTap,
    this.splashColor,
    this.highlightColor,
    this.splashFactory = InkSparkle.splashFactory,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final Color? splashColor;
  final Color? highlightColor;
  final InteractiveInkFeatureFactory splashFactory;

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? child
        : Stack(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              child,
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    splashColor: splashColor?.withOpacity(0.4) ?? Colors.white.withOpacity(0.4),
                    highlightColor: highlightColor?.withOpacity(0.4) ?? Colors.white.withOpacity(0.4),
                    splashFactory: splashFactory,
                  ),
                ),
              )
            ],
          );
  }
}
