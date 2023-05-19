import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/core/utility/errors.dart';
import 'package:flutter_technical_test/features/home/domain/injections/pokemons_injection.dart';

import '../../domain/entities/pokemons.dart';

final fetchPokemonProvider =
    AsyncNotifierProvider<PokemonNotifier, Either<Failure, Pokemons>>(() {
  return PokemonNotifier();
});

class PokemonNotifier extends AsyncNotifier<Either<Failure, Pokemons>> {
  @override
  FutureOr<Either<Failure, Pokemons>> build() async {
    return await _fetchPokemons();
  }

  Future<Either<Failure, Pokemons>> _fetchPokemons() async {
    final getPokemons = await ref.watch(pokemonProvider.future);

    final result = await getPokemons();

    return result;
  }
}
