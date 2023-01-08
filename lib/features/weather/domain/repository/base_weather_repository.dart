import '../enitities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Weather> getWeatherByCityName({required String cityName});
}
