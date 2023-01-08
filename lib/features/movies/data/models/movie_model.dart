import 'package:flutter_clean_arch/features/movies/domain/enitities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.genderId,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJSON(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backDropPath: json['poster_path'],
      genderId: List.from(json['genre_ids']),
      overView: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }
}
