import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utility/metwork_info.dart';
import '../../../../core/utility/errors.dart';
import '../datasources/habitat_datasource.dart';
import '../../domain/entities/habitats.dart';
import '../../domain/repositories/habitat_repository.dart';
import '../datasources/habitat_local_datasource.dart';

class HabitatRepositoryImplement implements HabitatRepository {
  final NetworkInfo networkInfo;
  final HabitatDataSource dataSource;
  final HabitatLocalDataSource localDataSource;

  HabitatRepositoryImplement({
    required this.networkInfo,
    required this.dataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Habitats>> getHabitats() async {
    if (!await networkInfo.isConnected) {
      final localData = await localDataSource.getHabitats();
      if (localData.habitats.isEmpty) {
        return const Left(
          ConnectionFailure(
            status: 408,
            message: "no internet Connection",
          ),
        );
      }
      return Right(localData);
    }

    try {
      final result = await dataSource.getHabitats();
      await localDataSource.setHabitats(result.habitats);
      return Right(result);
    } on DioError catch (e) {
      return Left(
        ServerFailure(
          status: e.response?.statusCode ?? 500,
          message: e.response?.data ?? "Server Error",
        ),
      );
    }
  }
}
