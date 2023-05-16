import '../../../../core/utility/static.dart';
import '../models/pokemons_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonDataSource {
  Future<PokemonsModel> getPokemons();
}

class PokemonDataSourceImplement implements PokemonDataSource {
  Dio dio;

  PokemonDataSourceImplement({required this.dio});

  @override
  Future<PokemonsModel> getPokemons() async {
    String url = "${baseUrl}pokemon";
    try {
      final response = await dio.get(url);
      return PokemonsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
