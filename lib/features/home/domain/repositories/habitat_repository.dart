import 'package:dartz/dartz.dart';
import '../../../../core/utility/errors.dart';
import '../entities/habitats.dart';

abstract class HabitatRepository {
  Future<Either<Failure, Habitats>> getHabitats();
}
