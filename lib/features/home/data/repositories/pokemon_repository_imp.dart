import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utility/errors.dart';
import '../../../../core/utility/metwork_info.dart';
import '../datasources/pokemon_datasorce.dart';
import '../../domain/entities/pokemons.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplement implements PokemonRepository {
  NetworkInfo networkInfo;
  PokemonDataSource dataSource;

  PokemonRepositoryImplement({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, Pokemons>> getPokemons() async {
    if (!await networkInfo.isConnected) {
      return const Left(
        ConnectionFailure(
          status: 408,
          message: "no internet connection",
        ),
      );
    }

    try {
      final response = await dataSource.getPokemons();
      return Right(response);
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
