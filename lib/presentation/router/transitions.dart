import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CupertinoTransition extends CustomTransitionPage {
  CupertinoTransition(passedChild)
      : super(
          child: passedChild,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return CupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              linearTransition: false,
              child: child,
            );
          },
        );
}
