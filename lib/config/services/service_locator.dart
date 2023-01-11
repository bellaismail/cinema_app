import 'package:flutter_clean_arch/features/movies/data/datasource/movie%20_remote_data_source.dart';
import 'package:flutter_clean_arch/features/movies/data/datasource/movie_local_datasource.dart';
import 'package:flutter_clean_arch/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_clean_arch/features/movies/domain/repository/base_movie_repository.dart';
import 'package:flutter_clean_arch/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter_clean_arch/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:flutter_clean_arch/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/movie_cubit.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init(/*{BuildContext? context}*/) {
    // get Cubit
    getIt.registerLazySingleton<MovieCubit>(() => MovieCubit()
      ..getNowplaying()
      ..getPopular()
      ..getTopRated());

    //movieREmoteDatasource
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    //movieLocalDatasource
    getIt.registerLazySingleton<BaseMovieLocalDatasource>(
        () => MovieLocalDataSourse());

    //repository
    getIt.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(
        baseMovieRemoteDataSource: getIt(), baseMovieLocalDatasource: getIt()));

    //useCase
    getIt.registerLazySingleton<GetNowPlayingMoviesUsecase>(
        () => GetNowPlayingMoviesUsecase(baseMovieRepository: getIt()));

    getIt.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(baseMovieRepository: getIt()));

    getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(baseMovieRepository: getIt()));
  }
}
