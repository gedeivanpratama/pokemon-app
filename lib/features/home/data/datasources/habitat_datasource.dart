import 'package:dio/dio.dart';
import 'package:flutter_technical_test/features/home/data/models/habitats_model.dart';

import '../../../../core/utility/static.dart';

abstract class HabitatDataSource {
  Future<HabitatsModel> getHabitats();
}

class HabitatDataSourceImplement implements HabitatDataSource {
  final Dio dio;
  HabitatDataSourceImplement({required this.dio});

  @override
  Future<HabitatsModel> getHabitats() async {
    String url = "${baseUrl}pokemon-habitat";
    try {
      final result = await dio.get(url);
      return HabitatsModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
