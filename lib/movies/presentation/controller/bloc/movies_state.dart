import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String errorMessageOfNowPlaying;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String errorMessageOfPopular;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String errorMessageOfTopRated;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.errorMessageOfNowPlaying = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.errorMessageOfPopular = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.errorMessageOfTopRated = '',
  });
  MoviesState copyWith(
      {List<Movie>? nowPlayingMovies,
      RequestState? nowPlayingState,
      String? errorMessageOfNowPlaying,
      List<Movie>? popularMovies,
      RequestState? popularState,
      String? errorMessageOfPopular,
      List<Movie>? topRatedMovies,
      RequestState? topRatedState,
      String? errorMessageOfTopRated}) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        errorMessageOfNowPlaying:
            errorMessageOfNowPlaying ?? this.errorMessageOfNowPlaying,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        errorMessageOfPopular:
            errorMessageOfPopular ?? this.errorMessageOfPopular,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        errorMessageOfTopRated:
            errorMessageOfTopRated ?? this.errorMessageOfTopRated);
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        errorMessageOfNowPlaying,
        popularMovies,
        popularState,
        errorMessageOfPopular,
        topRatedMovies,
        topRatedState,
        errorMessageOfTopRated
      ];
}
