import 'package:flutter_clean_arch/features/weather/data/datasource/remote_datasource.dart';
import 'package:flutter_clean_arch/features/weather/data/models/weather_model.dart';
import 'package:flutter_clean_arch/features/weather/domain/enitities/weather.dart';
import 'package:flutter_clean_arch/features/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDatasource baseRemoreDataSource;
  WeatherRepository({required this.baseRemoreDataSource});
  @override
  Future<Weather> getWeatherByCityName({required String cityName}) async {
    return (await baseRemoreDataSource.getWeatherByCountryName(
            cityName: cityName)) ??
        WeatherModel.fromJSON({});
  }
}
