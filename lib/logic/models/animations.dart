import 'package:ososs_test/utils/shapes.dart';

class AnimationsState {
  AppShape shape;
  AnimationsState({
    this.shape = AppShape.square,
  });

  AnimationsState copyWith({
    AppShape? shape,
  }) {
    return AnimationsState(
      shape: shape ?? this.shape,
    );
  }
}
