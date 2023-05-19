import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_technical_test/core/utility/errors.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemons_model.dart';
import 'package:flutter_technical_test/features/home/data/repositories/pokemon_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers.dart';
import '../../../../mockfiles/mock_generates.mocks.dart';

void main() {
  final MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  final MockPokemonDataSource dataSource = MockPokemonDataSource();
  final MockPokemonLocalDataSource localDataSource =
      MockPokemonLocalDataSource();
  late PokemonRepositoryImplement repository;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    repository = PokemonRepositoryImplement(
      networkInfo: mockNetworkInfo,
      dataSource: dataSource,
      localSource: localDataSource,
    );
  });

  tearDownAll(() {});

  group("get pokemon repository", () {
    group("get pokemon with good network", () {
      final Map<String, dynamic> response =
          jsonDecode(fixture("pokemons.json"));
      final pokemonsModel = PokemonsModel.fromJson(response);

      test("get pokemon success should return pokemons object", () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(dataSource.getPokemons()).thenAnswer((_) async => pokemonsModel);

        final result = await repository.getPokemons();

        verifyInOrder([mockNetworkInfo.isConnected, dataSource.getPokemons()]);

        expect(result, Right(pokemonsModel));
      });

      test("get pokemon success should return serverFailure object", () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(dataSource.getPokemons())
            .thenThrow(DioError(requestOptions: RequestOptions(path: 'path')));

        final result = await repository.getPokemons();

        // assert
        verifyInOrder([
          mockNetworkInfo.isConnected,
          dataSource.getPokemons(),
        ]);

        expect(result,
            const Left(ServerFailure(status: 500, message: "Server Error")));
      });
    });

    group("get pokemon with bad network", () {
      test("disconnect to internet should return connection failure", () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(localDataSource.getPokemons())
            .thenAnswer((_) async => const PokemonsModel(
                  itemCount: 0,
                  next: null,
                  pokemons: [], // local storage is null
                  previous: null,
                ));
        final result = await repository.getPokemons();

        verify(mockNetworkInfo.isConnected);

        expect(
          result,
          const Left(
            ConnectionFailure(
              status: 408,
              message: "no internet Connection",
            ),
          ),
        );
      });
    });
  });
}
