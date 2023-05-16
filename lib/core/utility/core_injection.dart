import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'metwork_info.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  return NetworkInfoImplementation(connectivity);
});
