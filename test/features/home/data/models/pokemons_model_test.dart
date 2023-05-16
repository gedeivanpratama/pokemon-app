import 'dart:convert';
import 'dart:io';

import 'package:flutter_technical_test/core/utility/static.dart';
import 'package:flutter_technical_test/features/home/data/models/pokemons_model.dart';
import 'package:flutter_technical_test/features/home/domain/entities/pokemons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testPokemons = PokemonsModel(
    itemCount: 1281,
    next: "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
    pokemons: [
      PokemonModel(
        image: "$imageUrl/1.png",
        name: "bulbasaur",
      ),
      PokemonModel(
        image: "$imageUrl/2.png",
        name: "ivysaur",
      )
    ],
    previous: null,
  );
  group("test Pokemon Data Model", () {
    final Map<String, dynamic> response = jsonDecode(fixture("pokemons.json"));

    test("PokemonModel should be subclass of Pokemon", () {
      expect(testPokemons, isA<Pokemons>());
    });

    test("return Json to Model", () async {
      final result = PokemonsModel.fromJson(response);
      expect(result, testPokemons);
    });
  });
}

String fixture(String name) => File('test/json/$name').readAsStringSync();
