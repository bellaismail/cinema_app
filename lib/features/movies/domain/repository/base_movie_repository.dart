import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/features/movies/domain/enitities/movie.dart';
import '../../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getNowPopularMovies();
  Future<Either<Failure, List<Movie>>> getNowTopRatedMovies();
  Future<Either<Failure, bool>> getDarkMode();
}
