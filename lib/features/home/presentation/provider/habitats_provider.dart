import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/core/utility/errors.dart';
import 'package:flutter_technical_test/features/home/domain/entities/habitats.dart';
import 'package:flutter_technical_test/features/home/domain/injections/habitats_injection.dart';

class HabitatNotifier extends AsyncNotifier<Either<Failure, Habitats>> {
  @override
  FutureOr<Either<Failure, Habitats>> build() async {
    return await _getHabitats();
  }

  Future<Either<Failure, Habitats>> _getHabitats() async {
    final getHabitats = await ref.watch(habitatProvider.future);
    return await getHabitats();
  }
}

final fetchHabitatProvider =
    AsyncNotifierProvider<HabitatNotifier, Either<Failure, Habitats>>(() {
  return HabitatNotifier();
});
