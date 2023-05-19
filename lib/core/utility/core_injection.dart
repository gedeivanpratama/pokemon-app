import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/home/data/models/habitat_local_model.dart';
import 'metwork_info.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final isarProvider = FutureProvider((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([HabitatLocalModelSchema], directory: dir.path);
});
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return NetworkInfoImplementation(connectivity);
});
