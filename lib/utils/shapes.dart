import 'package:flutter/material.dart';
import 'package:ososs_test/ui/screens/animations.dart';

/// this enum is used in [AnimationsPage]
/// it provides the decoration for each shape
enum AppShape {
  square,
  circle,
  roundedSquare;

  ///[size] parameter is used to make the border radius relative to the shape size
  BoxDecoration decoration(double size) {
    switch (this) {
      case AppShape.square:
        return const BoxDecoration(
          color: Color(0xff0d47a1),
        );
      case AppShape.circle:
        return BoxDecoration(
            color: const Color(
              0xfff26363,
            ),
            borderRadius: BorderRadius.circular(size / 2));
      case AppShape.roundedSquare:
        return BoxDecoration(
          color: const Color(0xff63b2f2),
          borderRadius: BorderRadius.circular(size / 6),
        );
    }
  }
}
