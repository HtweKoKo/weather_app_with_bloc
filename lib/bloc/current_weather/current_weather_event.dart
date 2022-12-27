part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherEvent {}
 class CurrentWeather2 extends CurrentWeatherEvent{
  final double lat;
  final double lon;

  CurrentWeather2(this.lat, this.lon, );

 }
