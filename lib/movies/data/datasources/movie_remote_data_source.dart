import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';

import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';

import '../../../core/error/exeptions.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParametrs parametrs);
  Future<List<RecommendationModel>> getRecommendations(
      RecommendatiosParameters parametrs);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await Dio().get(AppConstances.nowPlayingMoviesPath);
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } on DioException catch (error) {
      throw ServerExeption(ErrorMessageModel.fomJson(error.response!.data));
    }

    // if (response.statusCode == 200) {
    //   return (response.data['results'] as List)
    //       .map((e) => MovieModel.fromJson(e))
    //       .toList();
    // } else {
    //   throw ServerExeption(ErrorMessageModel.fomJson(response.data));
    // }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstances.popularPath);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerExeption(ErrorMessageModel.fomJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstances.topRatedPath);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerExeption(ErrorMessageModel.fomJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParametrs parametrs) async {
    final response =
        await Dio().get(AppConstances.movieDetailsPath(parametrs.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromjson(response.data);
    } else {
      throw ServerExeption(ErrorMessageModel.fomJson(response.data));
    }
  }

  Future<List<RecommendationModel>> getRecommendations(
      RecommendatiosParameters parametrs) async {
    final response =
        await Dio().get(AppConstances.recommendationsPath(parametrs.id));
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e))
          .toList();
    } else {
      throw ServerExeption(ErrorMessageModel.fomJson(response.data));
    }
  }
}
