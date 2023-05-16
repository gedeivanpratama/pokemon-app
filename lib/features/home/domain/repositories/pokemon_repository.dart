import 'package:dartz/dartz.dart';
import '../../../../core/utility/errors.dart';
import '../entities/pokemons.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemons>> getPokemons();
}
