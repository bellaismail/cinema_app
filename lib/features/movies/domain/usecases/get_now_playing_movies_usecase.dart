import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';
import '../../data/models/movie_model.dart';

abstract class BaseGetNowPlayingMoviesUsecase {
  Future<Either<Failure, List<MovieModel>>> excute();
}

class GetNowPlayingMoviesUsecase implements BaseGetNowPlayingMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;
  GetNowPlayingMoviesUsecase({required this.baseMovieRepository});
  @override
  Future<Either<Failure, List<MovieModel>>> excute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
