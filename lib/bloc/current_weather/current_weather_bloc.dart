import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/api_service.dart/weather_reporsity.dart';

import '../../data/model/curretWeather.dart';
import 'current_weather_state.dart';

part 'current_weather_event.dart';


class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
    WeatherReporsity _weatherReporsity = WeatherReporsity();
     CurrentWeatherBloc() : super(CurrentWeatherInitial()) {
    on<CurrentWeather2>((event, emit)async {
      try{
   emit(CurrentWeatherLoading());
  CurrentWeatherModel currentWeather =  await _weatherReporsity.getcurretWeather(lat: event.lat, lon:event.lon);
  emit(CurrentWeatherSuccess(currentWeather));
      }catch(e){
        emit(CurrentWeatherFail("Something Wrong"));
      }
    });
  
  
}
}