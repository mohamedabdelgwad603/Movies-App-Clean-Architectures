// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String errorMesageOfMovieDetails;
  final List<Recommendation> recommendaions;
  final RequestState recommendaionsState;
  final String errorMesageOfrecommendaions;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.errorMesageOfMovieDetails = '',
      this.recommendaions = const [],
      this.recommendaionsState = RequestState.loading,
      this.errorMesageOfrecommendaions = ''});

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        errorMesageOfMovieDetails,
        recommendaions,
        recommendaionsState,
        errorMesageOfrecommendaions
      ];

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? errorMesageOfMovieDetails,
    List<Recommendation>? recommendaions,
    RequestState? recommendaionsState,
    String? errorMesageOfrecommendaions,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      errorMesageOfMovieDetails:
          errorMesageOfMovieDetails ?? this.errorMesageOfMovieDetails,
      recommendaions: recommendaions ?? this.recommendaions,
      recommendaionsState: recommendaionsState ?? this.recommendaionsState,
      errorMesageOfrecommendaions:
          errorMesageOfrecommendaions ?? this.errorMesageOfrecommendaions,
    );
  }
}
