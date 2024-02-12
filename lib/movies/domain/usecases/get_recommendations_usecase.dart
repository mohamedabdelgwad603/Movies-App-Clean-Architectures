import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failures.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendation>, RecommendatiosParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendatiosParameters params) async {
    return await baseMoviesRepository.getRecommendations(params);
  }
}

class RecommendatiosParameters extends Equatable {
  final int id;

  const RecommendatiosParameters(this.id);

  @override
  List<Object?> get props => [id];
}
