import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/core/use_case/base_use_case.dart';
import 'package:flutter_clean_arch/features/movies/domain/enitities/movie.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUsecase implements BaseUseCase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;
  GetNowPlayingMoviesUsecase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
