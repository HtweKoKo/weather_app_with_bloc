part of 'search_location_bloc.dart';

@immutable
abstract class SearchLocationState {}

class SearchLocationInitial extends SearchLocationState {}
class SearchLocationLoading extends SearchLocationState{}
class SearchLocationSuccess extends SearchLocationState{
  final List<FindingLocation> locations;

  SearchLocationSuccess(this.locations);

}
class SearchLocationFail extends SearchLocationState{
  final String errorMessage;

  SearchLocationFail(this.errorMessage);
}
