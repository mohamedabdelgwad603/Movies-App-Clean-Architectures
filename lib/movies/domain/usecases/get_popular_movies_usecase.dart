import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../../../core/error/failures.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase implements BaseUseCase<List<Movie>, NoParam> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParam noParam) {
    return baseMoviesRepository.getPopularMovies();
  }
}
