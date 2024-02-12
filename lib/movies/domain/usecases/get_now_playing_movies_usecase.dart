import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failures.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase implements BaseUseCase<List<Movie>, NoParam> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParam noParam) {
    return baseMoviesRepository.getNowPlayingMovies();
  }
}
