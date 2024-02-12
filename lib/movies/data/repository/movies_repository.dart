// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exeptions.dart';
import 'package:movies_app/core/error/failures.dart';
import 'package:movies_app/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';

class MoviesReopsitory implements BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  const MoviesReopsitory({
    required this.baseMovieRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final response = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(response);
    } on ServerExeption catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final response = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(response);
    } on ServerExeption catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final response = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(response);
    } on ServerExeption catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParametrs parametrs) async {
    try {
      final response =
          await baseMovieRemoteDataSource.getMovieDetails(parametrs);
      return Right(response);
    } on ServerExeption catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendatiosParameters parametrs) async {
    try {
      final response =
          await baseMovieRemoteDataSource.getRecommendations(parametrs);
      return Right(response);
    } on ServerExeption catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
