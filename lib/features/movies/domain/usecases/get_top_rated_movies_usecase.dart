import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/use_case/base_use_case.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';
import '../../../../core/error/failure.dart';
import '../enitities/movie.dart';

class GetTopRatedMoviesUseCase implements BaseUseCase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;
  GetTopRatedMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getNowTopRatedMovies();
  }
}
