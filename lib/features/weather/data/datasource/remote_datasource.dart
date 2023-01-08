import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/config/data_helper/remote_data_helper.dart';
import 'package:flutter_clean_arch/features/weather/data/models/weather_model.dart';

abstract class BaseRemoteDatasource {
  Future<WeatherModel?> getWeatherByCountryName({required String cityName});
}

class RemoteDatasource implements BaseRemoteDatasource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(
      {required String cityName}) async {
    try {
      Response response =
          await WeatherRemoteDataHelper.dio!.get('/weather', queryParameters: {
        'q': cityName,
      });
      if (response.statusCode == 200) {
        print('*** statusCode:=> 200 ***');
      }
      var object = response.data;
      return WeatherModel.fromJSON(object);
    } catch (e) {
      print('=== someThing error$e ===');
      print('=== someThing error${e.runtimeType} ===');
      return null;
    }
  }
}
