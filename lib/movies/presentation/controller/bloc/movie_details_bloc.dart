import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/entities/movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final request =
          await getMovieDetailsUseCase(MovieDetailsParametrs(event.id));
      request.fold(
          (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              errorMesageOfMovieDetails: l.message)),
          (r) => emit(state.copyWith(
              movieDetailsState: RequestState.loaded, movieDetails: r)));
    });
    on<GetRecommendationsEvent>((event, emit) async {
      final request =
          await getRecommendationsUseCase(RecommendatiosParameters(event.id));
      request.fold(
          (l) => emit(state.copyWith(
              recommendaionsState: RequestState.error,
              errorMesageOfrecommendaions: l.message)),
          (r) => emit(state.copyWith(
              recommendaionsState: RequestState.loaded, recommendaions: r)));
    });
  }
}
