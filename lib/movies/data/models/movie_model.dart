import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(super.id, super.backdropPath, super.title, super.overview,
      super.genreIds, super.voteAverage, super.releaseDate);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        json['id'],
        json['backdrop_path'],
        json['title'],
        json['overview'],
        List<int>.from((json['genre_ids'] as List).map((e) => e)),
        json['vote_average'],
        json['release_date']);
  }
}
