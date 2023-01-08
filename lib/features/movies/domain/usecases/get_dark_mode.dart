import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';
import '../../../../core/error/failure.dart';

abstract class BaseGetDarkMode {
  Future<Either<Failure, bool>> excute();
}

class GetDarkMode implements BaseGetDarkMode {
  final BaseMovieRepository baseMovieRepository;
  GetDarkMode({required this.baseMovieRepository});
  @override
  Future<Either<Failure, bool>> excute() {
    return baseMovieRepository.getDarkMode();
  }
}
