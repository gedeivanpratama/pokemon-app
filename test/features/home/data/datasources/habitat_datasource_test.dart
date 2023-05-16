import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_technical_test/core/utility/static.dart';
import 'package:flutter_technical_test/features/home/data/datasources/habitat_datasource.dart';
import 'package:flutter_technical_test/features/home/data/models/habitats_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../helpers.dart';

void main() {
  final Dio dio = Dio();
  final DioAdapter dioAdapter = DioAdapter(dio: dio);
  late HabitatDataSourceImplement datasource;

  setUp(() {
    datasource = HabitatDataSourceImplement(dio: dioAdapter.dio);
  });

  group("get Habitat datasource", () {
    String url = "${baseUrl}pokemon-habitat";

    final Map<String, dynamic> response = jsonDecode(fixture("habitats.json"));
    final habitatsModel = HabitatsModel.fromJson(response);
    final DioError dioError =
        DioError(requestOptions: RequestOptions(path: url));
    test("get habitats should return HabitatModel when success", () async {
      dioAdapter.onGet(url, (server) {
        return server.reply(HttpStatus.ok, response);
      });
      final result = await datasource.getHabitats();
      expect(result, habitatsModel);
    });

    test("should return exception when error", () {
      dioAdapter.onGet(url, (server) {
        return server.throws(HttpStatus.internalServerError, dioError);
      });

      expect(
        () async => await datasource.getHabitats(),
        throwsA(isA<DioError>()),
      );
    });
  });
}
