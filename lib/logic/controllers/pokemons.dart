import 'package:bloc/bloc.dart';
import 'package:ososs_test/logic/models/pokemons.dart';
import 'package:ososs_test/logic/providers/pokemons_api.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(PokemonsState()) {
    load().then((value) => null);
  }

  Future<void> load() async {
    //notify ui (items loading)
    emit(state.copyWith(loading: true));
    try {
      //send http request
      Map data = await PokemonsAPI.getPokemons(state.items.length);
      List items = [...state.items, ...data['results']];
      //update ui with the new data
      emit(state.copyWith(
          count: data['count'], items: items, loaded: true, loading: false));
    } catch (e) {
      // loading is false while loaded is still false so error message will be displayed
      emit(state.copyWith(loading: false));
    }
  }
}
