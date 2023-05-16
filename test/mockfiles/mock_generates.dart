import 'package:flutter_technical_test/core/utility/metwork_info.dart';
import 'package:flutter_technical_test/features/home/data/datasources/pokemon_datasorce.dart';
import 'package:flutter_technical_test/features/home/domain/repositories/pokemon_repository.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_habitats.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_pokemons.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  PokemonDataSource,
  PokemonRepository,
  NetworkInfo,
  GetPokemons,
  GetHabitats
])
void main() {}
