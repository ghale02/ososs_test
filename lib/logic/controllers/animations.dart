import 'package:bloc/bloc.dart';
import 'package:ososs_test/logic/models/animations.dart';
import 'package:ososs_test/utils/shapes.dart';

class AnimationsCubit extends Cubit<AnimationsState> {
  AnimationsCubit() : super(AnimationsState());
  //set the shape value in state
  void setShape(AppShape shape) => emit(state.copyWith(shape: shape));
}
