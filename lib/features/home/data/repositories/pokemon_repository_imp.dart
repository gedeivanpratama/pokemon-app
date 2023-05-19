import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_technical_test/features/home/data/datasources/pokemon_local_datasource.dart';
import '../../../../core/utility/errors.dart';
import '../../../../core/utility/metwork_info.dart';
import '../datasources/pokemon_datasorce.dart';
import '../../domain/entities/pokemons.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplement implements PokemonRepository {
  NetworkInfo networkInfo;
  PokemonDataSource dataSource;
  PokemonLocalDataSource localSource;

  PokemonRepositoryImplement({
    required this.networkInfo,
    required this.dataSource,
    required this.localSource,
  });

  @override
  Future<Either<Failure, Pokemons>> getPokemons() async {
    if (!await networkInfo.isConnected) {
      final localData = await localSource.getPokemons();
      if (localData.pokemons.isEmpty) {
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
      final response = await dataSource.getPokemons();
      await localSource.setPokemons(response.pokemons);
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
