import 'package:flutter_technical_test/core/utility/extensions.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemon_local_model.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemons_model.dart';
import 'package:flutter_technical_test/features/home/domain/entities/pokemons.dart';
import 'package:isar/isar.dart';

import '../models/habitat_local_model.dart';

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
  Future<bool> setPokemons(List<Pokemon> habitats) async {
    await isar.writeTxn(() async {
      for (var habitat in habitats) {
        HabitatLocalModel data = HabitatLocalModel();
        data.name = habitat.name;
        data.url = habitat.image.toImageUrl();
        await isar.habitatLocalModels.put(data);
      }
    });
    return true;
  }
}
