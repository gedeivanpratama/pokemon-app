import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_technical_test/core/utility/static.dart';
import 'package:flutter_technical_test/features/home/data/datasources/pokemon_datasorce.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemons_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../helpers.dart';

void main() {
  final Dio dio = Dio();
  final DioAdapter dioAdapter = DioAdapter(dio: dio);
  late PokemonDataSourceImplement pokemonDataSource;

  setUp(() {
    pokemonDataSource = PokemonDataSourceImplement(dio: dioAdapter.dio);
  });

  group("Get Pokemons", () {
    String url = "${baseUrl}pokemon";

    final Map<String, dynamic> response = jsonDecode(fixture("pokemons.json"));
    final pokemonsModel = PokemonsModel.fromJson(response);
    final DioError dioError =
        DioError(requestOptions: RequestOptions(path: url));

    test("should return pokemonModel when success", () async {
      dioAdapter.onGet(url, (server) {
        return server.reply(HttpStatus.ok, response);
      });
      final result = await pokemonDataSource.getPokemons();
      expect(result, pokemonsModel);
    });

    test("should return exception when error", () {
      dioAdapter.onGet(url, (server) {
        return server.throws(HttpStatus.internalServerError, dioError);
      });

      expect(
        () async => await pokemonDataSource.getPokemons(),
        throwsA(isA<DioError>()),
      );
    });
  });
}
