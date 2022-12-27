import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/api_service.dart/weather_reporsity.dart';
import 'package:weather_app/data/model/pollutionModel.dart';

part 'air_pollution_event.dart';
part 'air_pollution_state.dart';

class AirPollutionBloc extends Bloc<AirPollutionEvent, AirPollutionState> {
  WeatherReporsity _weatherReporsity= WeatherReporsity();
  AirPollutionBloc() : super(AirPollutionInitial()) {

    on<AirPollution>((event, emit) async{
      try{
     emit(AirPollutionLoading());
    AirPollutionModel aa = await  _weatherReporsity.getAirPollution(lat: event.lat, lon: event.lon);
      emit(AirPollutionSuccess(aa));
      }catch(e){
        emit(AirPollutionfail(e.toString()));
      }
    });
  }
}
