import 'dart:convert';

import 'package:flutter_technical_test/features/home/data/models/habitats_model.dart';
import 'package:flutter_technical_test/features/home/domain/entities/habitats.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers.dart';

void main() {
  const testHabitats = HabitatsModel(
    count: 9,
    next: null,
    previous: null,
    habitats: [
      HabitatModel(
        name: "cave",
        url: "https://pokeapi.co/api/v2/pokemon-habitat/1/",
      ),
      HabitatModel(
        name: "forest",
        url: "https://pokeapi.co/api/v2/pokemon-habitat/2/",
      )
    ],
  );

  group("test Pokemon Data Model", () {
    final Map<String, dynamic> response = jsonDecode(fixture("habitats.json"));

    test("PokemonModel should be subclass of Pokemon", () {
      expect(testHabitats, isA<Habitats>());
    });

    test("return Json to Model", () async {
      final result = HabitatsModel.fromJson(response);
      expect(result, testHabitats);
    });
  });
}
