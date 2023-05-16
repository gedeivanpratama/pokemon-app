import 'package:dartz/dartz.dart';
import 'package:flutter_technical_test/core/utility/errors.dart';
import 'package:flutter_technical_test/features/home/domain/entities/pokemons.dart';
import 'package:flutter_technical_test/features/home/domain/repositories/pokemon_repository.dart';

abstract class GetPokemonsUseCase {
  Future<Either<Failure, Pokemons>> call();
}

class GetPokemons implements GetPokemonsUseCase {
  final PokemonRepository repository;
  GetPokemons({required this.repository});

  @override
  Future<Either<Failure, Pokemons>> call() async {
    return await repository.getPokemons();
  }
}
