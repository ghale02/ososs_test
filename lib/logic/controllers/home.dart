import 'package:bloc/bloc.dart';
import 'package:ososs_test/logic/models/home.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  //change nameText value in the state
  void setName(String name) => emit(state.copyWith(nameText: name));
}
