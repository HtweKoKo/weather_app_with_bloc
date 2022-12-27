part of 'search_location_bloc.dart';

@immutable
abstract class SearchLocationEvent {}

class Searchlocatione extends SearchLocationEvent{
    final String city;

  Searchlocatione(this.city);
    

}
