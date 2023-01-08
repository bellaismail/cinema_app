import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/error/error_message_model.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/features/movies/data/datasource/movie%20_remote_data_source.dart';
import 'package:flutter_clean_arch/features/movies/data/datasource/movie_local_datasource.dart';
import 'package:flutter_clean_arch/features/movies/domain/enitities/movie.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';
import '../models/movie_model.dart';

class MovieRepository implements BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  final BaseMovieLocalDatasource baseMovieLocalDatasource;
  MovieRepository(
      {required this.baseMovieRemoteDataSource,
      required this.baseMovieLocalDatasource});
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      return Right(await baseMovieRemoteDataSource.getNowPlayingMovie());
    } on DioError catch (e) {
      var resData = e.response!.data;
      return Left(
        ServerFailure(
          errorMessageModel: ErrorMessageModel.fromJSON(resData),
        ),
      );
    } catch (e) {
      return Left(
        Failure(message: 'may be server Error!'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPopularMovies() async {
    try {
      return Right(await baseMovieRemoteDataSource.getNowPopularMovie());
    } on DioError catch (e) {
      var resData = e.response!.data;
      return Left(
        ServerFailure(
          errorMessageModel: ErrorMessageModel.fromJSON(resData),
        ),
      );
    } catch (e) {
      return Left(Failure(message: 'may be server Error!'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowTopRatedMovies() async {
    try {
      return Right(await baseMovieRemoteDataSource.getNowTopRatedMovie());
    } on DioError catch (e) {
      var resData = e.response!.data;
      return Left(
        ServerFailure(
          errorMessageModel: ErrorMessageModel.fromJSON(resData),
        ),
      );
    } catch (e) {
      return Left(
        Failure(message: 'may be server Error!'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> getDarkMode() async {
    try {
      return Right(await baseMovieLocalDatasource.getDarkMood());
    } catch (e) {
      return left(DatabaseFailure(message: 'databaseErrorFailure'));
    }
  }
}
