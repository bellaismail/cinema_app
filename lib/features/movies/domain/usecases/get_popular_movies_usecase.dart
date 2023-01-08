import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/features/movies/domain/enitities/movie.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';

import '../../../../core/error/failure.dart';

abstract class BaseGetPopularMoviesUseCase {
  Future<Either<Failure, List<Movie>>> excute();
}

class GetPopularMoviesUseCase implements BaseGetPopularMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;
  GetPopularMoviesUseCase({required this.baseMovieRepository});
  @override
  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMovieRepository.getNowPopularMovies();
  }
}
