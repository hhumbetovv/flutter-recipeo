import 'package:flutter/material.dart';

class BaseButtonStyle extends ButtonStyle {
  BaseButtonStyle({
    required bool isCollabsed,
    Color? border,
    Color? borderDisabled,
    Color? background,
    Color? backgroundDisabled,
    Color? overlay,
  }) : super(
          splashFactory: InkSparkle.splashFactory,
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          minimumSize: MaterialStatePropertyAll(Size.fromHeight(isCollabsed ? 40 : 56)),
          side: MaterialStateProperty.resolveWith((states) {
            Color? color = border;
            if (states.contains(MaterialState.disabled)) color = borderDisabled ?? border;
            return color != null ? BorderSide(width: 2, color: color) : null;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) return backgroundDisabled ?? background;
            return background;
          }),
          overlayColor: MaterialStatePropertyAll(overlay?.withOpacity(0.25)),
        );
}
