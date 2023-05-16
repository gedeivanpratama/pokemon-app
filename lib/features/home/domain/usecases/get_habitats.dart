import 'package:dartz/dartz.dart';
import 'package:flutter_technical_test/core/utility/errors.dart';
import 'package:flutter_technical_test/features/home/domain/entities/habitats.dart';
import '../repositories/habitat_repository.dart';

abstract class GetHabitatUseCase {
  Future<Either<Failure, Habitats>> call();
}

class GetHabitats implements GetHabitatUseCase {
  final HabitatRepository repository;
  GetHabitats({required this.repository});
  @override
  Future<Either<Failure, Habitats>> call() async {
    return await repository.getHabitats();
  }
}
