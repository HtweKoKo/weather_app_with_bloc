part of 'air_pollution_bloc.dart';

@immutable
abstract class AirPollutionEvent {}
class AirPollution extends AirPollutionEvent{
  final double lat;
  final double lon;

  AirPollution(this.lat, this.lon);
}
