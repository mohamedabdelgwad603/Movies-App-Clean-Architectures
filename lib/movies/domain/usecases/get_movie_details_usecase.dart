import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParametrs> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParametrs params) async {
    return await baseMoviesRepository.getMovieDetails(params);
  }
}

class MovieDetailsParametrs extends Equatable {
  final int id;

  const MovieDetailsParametrs(this.id);

  @override
  List<Object?> get props => [id];
}
