import 'package:flutter_technical_test/features/home/data/datasources/pokemon_datasorce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/features/home/data/repositories/pokemon_repository_imp.dart';
import 'package:flutter_technical_test/features/home/domain/repositories/pokemon_repository.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_pokemons.dart';

import '../../../../core/utility/core_injection.dart';
import '../../data/datasources/pokemon_local_datasource.dart';

final pokemonDataProvider = Provider<PokemonDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PokemonDataSourceImplement(dio: dio);
});

final pokemonLocalDataProvider =
    FutureProvider<PokemonLocalDataSource>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return PokemonLocalDatasourceImplement(isar: isar);
});

final pokemonRepoProvider = FutureProvider<PokemonRepository>((ref) async {
  final network = ref.watch(networkInfoProvider);
  final dataSource = ref.watch(pokemonDataProvider);
  final localSource = await ref.watch(pokemonLocalDataProvider.future);

  return PokemonRepositoryImplement(
    networkInfo: network,
    dataSource: dataSource,
    localSource: localSource,
  );
});

final pokemonProvider = FutureProvider<GetPokemons>((ref) async {
  final repo = await ref.watch(pokemonRepoProvider.future);
  return GetPokemons(repository: repo);
});
