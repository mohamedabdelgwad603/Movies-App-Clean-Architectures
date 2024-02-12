import 'package:movies_app/movies/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({required super.id, required super.name});
  factory GenreModel.fromjson(Map<String, dynamic> json) {
    return GenreModel(id: json['id'], name: json['name']);
  }
}
