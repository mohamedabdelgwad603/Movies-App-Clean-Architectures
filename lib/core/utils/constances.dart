import 'package:movies_app/movies/domain/entities/movie_details.dart';

class AppConstances {
  static const apiKey = 'aa59dcc850ade5b88f0795fdf33f983f';
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$imageBaseUrl$path';
  static String movieDetailsPath(int id) =>
      '$baseUrl/movie/$id?api_key=$apiKey';
  static String recommendationsPath(int id) =>
      '$baseUrl/movie/$id/recommendations?api_key=$apiKey';
}
