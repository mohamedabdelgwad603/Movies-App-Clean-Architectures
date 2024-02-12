part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int id;

  const GetRecommendationsEvent(this.id);
  @override
  List<Object?> get props => [];
}
