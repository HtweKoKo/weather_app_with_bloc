import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/api_service.dart/weather_reporsity.dart';
import 'package:weather_app/data/model/FindingLocation.dart';

part 'search_location_event.dart';
part 'search_location_state.dart';

class SearchLocationBloc extends Bloc<SearchLocationEvent, SearchLocationState> {
WeatherReporsity _weatherReporsity = WeatherReporsity();
  SearchLocationBloc() : super(SearchLocationInitial()) {
    
    on<Searchlocatione>((event, emit) async{
      try{
        emit(SearchLocationLoading()) ;
      List<FindingLocation> cities = await _weatherReporsity.searchLocation2(location: event.city);
      emit(SearchLocationSuccess(cities));
      }catch(e){
          emit(SearchLocationFail("Something was Wrong"));
      }
        
    });
  }
}
