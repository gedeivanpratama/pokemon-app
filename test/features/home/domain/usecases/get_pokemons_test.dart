import 'package:dartz/dartz.dart';
import 'package:flutter_technical_test/core/utility/errors.dart';
import 'package:flutter_technical_test/core/utility/static.dart';
import 'package:flutter_technical_test/features/home/domain/entities/pokemons.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_pokemons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mockfiles/mock_generates.mocks.dart';

void main() {
  MockPokemonRepository repository = MockPokemonRepository();
  GetPokemons getPokemons = GetPokemons(repository: repository);
  const testPokemons = Pokemons(
    itemCount: 1281,
    next: "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
    pokemons: [
      Pokemon(
        image: "$imageUrl/1.png",
        name: "bulbasaur",
      ),
      Pokemon(
        image: "$imageUrl/2.png",
        name: "ivysaur",
      )
    ],
    previous: null,
  );
  const serverFailure = ServerFailure(status: 500, message: "Server Error");

  test("get Pokemon usecase success should return Pokemons object", () async {
    when(repository.getPokemons())
        .thenAnswer((_) async => const Right(testPokemons));
    final result = await getPokemons();
    verify(repository.getPokemons());
    verifyNoMoreInteractions(repository);
    expect(result, const Right(testPokemons));
  });

  test("get pokemon usecase failuter should return server failuter", () async {
    when(repository.getPokemons())
        .thenAnswer((_) async => const Left(serverFailure));
    final result = await getPokemons();

    verify(repository.getPokemons());
    verifyNoMoreInteractions(repository);
    expect(result, const Left(serverFailure));
  });
}
