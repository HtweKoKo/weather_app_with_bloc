part of 'air_pollution_bloc.dart';

@immutable
abstract class AirPollutionState {}

class AirPollutionInitial extends AirPollutionState {}
class AirPollutionLoading extends AirPollutionState{}
class AirPollutionSuccess extends AirPollutionState{
  final AirPollutionModel airPollutionModel;

  AirPollutionSuccess(this.airPollutionModel);
  
}
class AirPollutionfail extends AirPollutionState{
  final String errorMessage;

  AirPollutionfail(this.errorMessage);
}
