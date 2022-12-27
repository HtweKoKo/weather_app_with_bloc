


import 'package:weather_app/data/model/curretWeather.dart';

abstract class CurrentWeatherState {}

class CurrentWeatherInitial extends CurrentWeatherState {}
class CurrentWeatherLoading extends CurrentWeatherState{}
class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherModel currentWeather;

  CurrentWeatherSuccess(this.currentWeather);
}
class CurrentWeatherFail extends CurrentWeatherState{
  final String errorMessage;

  CurrentWeatherFail(this.errorMessage);
}
