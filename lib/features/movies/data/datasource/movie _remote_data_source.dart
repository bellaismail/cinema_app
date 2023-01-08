import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/features/movies/data/models/movie_model.dart';
import '../../../../config/data_helper/remote_data_helper.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getNowPopularMovie();
  Future<List<MovieModel>> getNowTopRatedMovie();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    Response response =
        await MovieRemoteDataHelper.dio!.get(AppStrings.moviePlayingEndPoint);
    List myList = response.data['results'] as List;
    return (myList.map((json) => MovieModel.fromJSON(json)).toList());
  }

  @override
  Future<List<MovieModel>> getNowPopularMovie() async {
    Response response =
        await MovieRemoteDataHelper.dio!.get(AppStrings.moviePopularEndPoint);
    List myList = response.data['results'] as List;
    return myList.map((json) => MovieModel.fromJSON(json)).toList();
  }

  @override
  Future<List<MovieModel>> getNowTopRatedMovie() async {
    Response response =
        await MovieRemoteDataHelper.dio!.get(AppStrings.movieTopRatedEndPoint);
    List myList = response.data['results'] as List;
    return myList.map((json) => MovieModel.fromJSON(json)).toList();
  }
}
