import 'package:flutter_technical_test/features/home/data/datasources/pokemon_datasorce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/features/home/data/repositories/pokemon_repository_imp.dart';
import 'package:flutter_technical_test/features/home/domain/repositories/pokemon_repository.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_pokemons.dart';

import '../../../../core/utility/core_injection.dart';

final pokemonDataProvider = Provider<PokemonDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PokemonDataSourceImplement(dio: dio);
});

final pokemonRepoProvider = Provider<PokemonRepository>((ref) {
  final network = ref.watch(networkInfoProvider);
  final dataSource = ref.watch(pokemonDataProvider);
  return PokemonRepositoryImplement(
    networkInfo: network,
    dataSource: dataSource,
  );
});

final pokemonProvider = Provider<GetPokemons>((ref) {
  final repo = ref.watch(pokemonRepoProvider);
  return GetPokemons(repository: repo);
});
