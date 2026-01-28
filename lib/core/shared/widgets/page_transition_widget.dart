import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Centralized page transition helper.
/// Use [buildPageWithTransition] inside router `pageBuilder` to get consistent transitions.
enum PageTransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  slideFromBottom,
  scale,
  rotate,
  none,
}

CustomTransitionPage<T> buildPageWithTransition<T>({
  required LocalKey key,
  required Widget child,
  PageTransitionType type = PageTransitionType.none,
  Duration duration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (type) {
        case PageTransitionType.fade:
          return FadeTransition(opacity: animation, child: child);

        case PageTransitionType.slideFromRight:
          final offset = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          return SlideTransition(position: offset, child: child);

        case PageTransitionType.slideFromLeft:
          final offset = Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          return SlideTransition(position: offset, child: child);

        case PageTransitionType.slideFromBottom:
          final offset = Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          return SlideTransition(position: offset, child: child);

        case PageTransitionType.scale:
          final scale = Tween<double>(
            begin: 0.9,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          return ScaleTransition(scale: scale, child: child);

        case PageTransitionType.rotate:
          final turns = Tween<double>(
            begin: -0.02,
            end: 0.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          return RotationTransition(turns: turns, child: child);

        case PageTransitionType.none:
          return child;
      }
    },
  );
}
