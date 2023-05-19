import 'package:flutter_technical_test/core/utility/extensions.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemon_local_model.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemons_model.dart';
import 'package:flutter_technical_test/features/home/domain/entities/pokemons.dart';
import 'package:isar/isar.dart';

abstract class PokemonLocalDataSource {
  Future<PokemonsModel> getPokemons();
  Future<bool> setPokemons(List<Pokemon> habitats);
}

class PokemonLocalDatasourceImplement implements PokemonLocalDataSource {
  Isar isar;
  PokemonLocalDatasourceImplement({required this.isar});

  @override
  Future<PokemonsModel> getPokemons() async {
    try {
      final results = await isar.pokemonLocalModels.where().findAll();
      List<PokemonModel> data = [];
      for (var result in results) {
        data.add(PokemonModel(name: result.name, image: result.url));
      }
      return PokemonsModel(
        itemCount: 0,
        next: null,
        pokemons: data,
        previous: null,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> setPokemons(List<Pokemon> pokemons) async {
    try {
      await isar.writeTxn(() async {
        for (var pokemon in pokemons) {
          PokemonLocalModel data = PokemonLocalModel();
          data.name = pokemon.name;
          data.url = pokemon.image.toImageUrl();
          await isar.pokemonLocalModels.put(data);
        }
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
