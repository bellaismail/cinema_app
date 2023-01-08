import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';

class WeatherRemoteDataHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: AppStrings.weatherBaseURL,
          receiveDataWhenStatusError: true,
          queryParameters: {
            'appid': AppStrings.weatherKeyId,
          }),
    );
  }
}

class MovieRemoteDataHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppStrings.movieBaseURL,
        receiveDataWhenStatusError: true,
        queryParameters: {
          'api_key': AppStrings.movieKeyId,
          'language': 'en-US',
        },
      ),
    );
  }
}
