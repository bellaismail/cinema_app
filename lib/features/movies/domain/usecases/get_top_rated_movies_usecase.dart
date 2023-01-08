import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';
import '../../../../core/error/failure.dart';
import '../enitities/movie.dart';

abstract class BaseGetTopRatedMoviesUseCase {
  Future<Either<Failure, List<Movie>>> excute();
}

class GetTopRatedMoviesUseCase implements BaseGetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;
  GetTopRatedMoviesUseCase({required this.baseMovieRepository});
  @override
  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMovieRepository.getNowTopRatedMovies();
  }
}
