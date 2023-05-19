import 'package:isar/isar.dart';

part 'habitat_local_model.g.dart';

@collection
class HabitatLocalModel {
  Id id = Isar.autoIncrement;

  late String name;

  late String url;
}
