import 'package:flutter_technical_test/features/home/data/models/habitats_model.dart';

import '../../domain/entities/habitats.dart';
import '../models/habitat_local_model.dart';
import 'package:isar/isar.dart';

abstract class HabitatLocalDataSource {
  Future<HabitatsModel> getHabitats();
  Future<bool> setHabitats(List<Habitat> habitats);
}

class HabitatLocalDataSourceImpl implements HabitatLocalDataSource {
  Isar isar;

  HabitatLocalDataSourceImpl({required this.isar});

  @override
  Future<HabitatsModel> getHabitats() async {
    try {
      final results = await isar.habitatLocalModels.where().findAll();
      List<HabitatModel> data = [];
      for (var result in results) {
        data.add(HabitatModel(name: result.name, url: result.url));
      }
      return HabitatsModel(
        count: 0,
        next: null,
        previous: null,
        habitats: data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> setHabitats(List<Habitat> habitats) async {
    try {
      await isar.writeTxn(() async {
        for (var habitat in habitats) {
          HabitatLocalModel data = HabitatLocalModel();
          data.name = habitat.name;
          data.url = habitat.url;
          await isar.habitatLocalModels.put(data);
        }
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
