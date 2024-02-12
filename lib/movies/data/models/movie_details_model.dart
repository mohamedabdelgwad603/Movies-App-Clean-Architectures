import 'package:movies_app/movies/data/models/genre_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      super.backdropPath,
      super.id,
      super.overview,
      super.releaseDate,
      super.title,
      super.runTime,
      super.voteAverage,
      super.genres);
  factory MovieDetailsModel.fromjson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        json['backdrop_path'],
        json['id'],
        json['overview'],
        json['release_date'],
        json['title'],
        json['runtime'],
        json['vote_average'],
        (json['genres'] as List)
            .map((genre) => GenreModel.fromjson(genre))
            .toList());
  }
}
