import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/features/home/data/datasources/habitat_datasource.dart';
import 'package:flutter_technical_test/features/home/data/datasources/habitat_local_datasource.dart';
import 'package:flutter_technical_test/features/home/data/repositories/habitat_repository_implement.dart';
import 'package:flutter_technical_test/features/home/domain/repositories/habitat_repository.dart';
import 'package:flutter_technical_test/features/home/domain/usecases/get_habitats.dart';

import '../../../../core/utility/core_injection.dart';

final habitatDataProvider = Provider<HabitatDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HabitatDataSourceImplement(dio: dio);
});

final habitatLocalProviderProvider =
    FutureProvider<HabitatLocalDataSource>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return HabitatLocalDataSourceImpl(isar: isar);
});

final habitatRepoProvider = FutureProvider<HabitatRepository>((ref) async {
  final network = ref.watch(networkInfoProvider);
  final dataSource = ref.watch(habitatDataProvider);
  final localSource = await ref.watch(habitatLocalProviderProvider.future);
  return HabitatRepositoryImplement(
      networkInfo: network,
      dataSource: dataSource,
      localDataSource: localSource);
});

final habitatProvider = FutureProvider<GetHabitats>((ref) async {
  final repo = await ref.watch(habitatRepoProvider.future);
  return GetHabitats(repository: repo);
});
