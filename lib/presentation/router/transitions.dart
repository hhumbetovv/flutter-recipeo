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

class DownToUpTransition extends CustomTransitionPage {
  DownToUpTransition(passedChild)
      : super(
          child: passedChild,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.ease)),
              ),
              child: child,
            );
          },
        );
}
