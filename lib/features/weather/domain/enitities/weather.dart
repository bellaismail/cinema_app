import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int id;
  final String cityName;
  final String main;
  final String description;
  final int pressure;

  const Weather(
      {required this.id,
      required this.cityName,
      required this.main,
      required this.description,
      required this.pressure});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        id,
        cityName,
        main,
        description,
        pressure,
      ];
}
