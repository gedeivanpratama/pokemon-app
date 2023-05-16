import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/features/home/data/datasources/habitat_datasource.dart';
import 'package:flutter_technical_test/features/home/data/repositories/habitat_repository_implement.dart';
import 'package:flutter_technical_test/features/home/domain/repositories/habitat_repository.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_habitats.dart';

import '../../../../core/utility/core_injection.dart';

final habitatDataProvider = Provider<HabitatDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HabitatDataSourceImplement(dio: dio);
});

final habitatRepoProvider = Provider<HabitatRepository>((ref) {
  final network = ref.watch(networkInfoProvider);
  final dataSource = ref.watch(habitatDataProvider);
  return HabitatRepositoryImplement(
    networkInfo: network,
    dataSource: dataSource,
  );
});

final habitatProvider = Provider<GetHabitats>((ref) {
  final repo = ref.watch(habitatRepoProvider);
  return GetHabitats(repository: repo);
});
