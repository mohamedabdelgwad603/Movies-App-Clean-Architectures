import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final int runTime;
  final double voteAverage;
  final List<Genre> genres;

  const MovieDetails(
      this.backdropPath,
      this.id,
      this.overview,
      this.releaseDate,
      this.title,
      this.runTime,
      this.voteAverage,
      this.genres);

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        title,
        runTime,
        voteAverage,
        genres
      ];
}
