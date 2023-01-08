import 'package:flutter_clean_arch/features/weather/domain/enitities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.cityName,
    required super.main,
    required super.description,
    required super.pressure,
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> json) => WeatherModel(
        id: json['id'],
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        pressure: json['main']['pressure'],
      );
}
