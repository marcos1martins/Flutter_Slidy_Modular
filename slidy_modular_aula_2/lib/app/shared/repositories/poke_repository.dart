import 'package:dio/dio.dart';

import '../models/pokemon_model.dart';


class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = List<PokemonModel>();
    for (var json in (response.data['results'] as List)) {
      PokemonModel  model = PokemonModel(json['name']);
      list.add(model);
    }

    return list;
  }

}