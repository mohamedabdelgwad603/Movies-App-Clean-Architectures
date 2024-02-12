// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  const Movie(this.id, this.backdropPath, this.title, this.overview,
      this.genreIds, this.voteAverage, this.releaseDate);

  @override
  List<Object?> get props =>
      [id, backdropPath, title, overview, genreIds, voteAverage, releaseDate];
}
