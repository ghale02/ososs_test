import 'package:dio/dio.dart';

class PokemonsAPI {
  static Future<Map> getPokemons(int offset) async {
    Dio client = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
    Response response = await client.get('pokemon/?limit=25&offset=$offset');
    return response.data;
  }
}
