import 'package:isar/isar.dart';

part 'pokemon_local_model.g.dart';

@collection
class PokemonLocalModel {
  Id id = Isar.autoIncrement;

  late String name;

  late String url;
}
