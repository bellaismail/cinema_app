import 'package:flutter_clean_arch/features/weather/domain/enitities/weather.dart';
import 'package:flutter_clean_arch/features/weather/domain/repository/base_weather_repository.dart';

abstract class BaseGetWeatherByCountry {
  Future<Weather> excute({required String cityName});
}

class GetWeatherByCountry extends BaseGetWeatherByCountry {
  final BaseWeatherRepository repository;
  GetWeatherByCountry({required this.repository});

  @override
  excute({required String cityName}) async {
    return await repository.getWeatherByCityName(cityName: cityName);
  }
}
