
import 'package:flutter/animation.dart';
import 'package:retrofit/dio.dart';
import 'package:weather_app/Constant.dart';
import 'package:weather_app/data/api_service.dart/findingLocation_apiservice.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/model/FindingLocation.dart';
import 'package:weather_app/data/model/curretWeather.dart';
import 'package:weather_app/data/model/pollutionModel.dart';

class WeatherReporsity{
late FindingLocationApiService _findingLocationApiService;
late String _appId;

  WeatherReporsity(){
    final Dio dio = Dio();
    _appId = ApiConstant.APPID;
    
      _findingLocationApiService = FindingLocationApiService(dio);
  }

      Future<List<FindingLocation>> searchLocation2 ({required String location})
        => _findingLocationApiService.searchLocation(location: location, limit: 10, 
        appId: _appId);

        Future<CurrentWeatherModel> getcurretWeather (
          {required double lat,required double lon}) =>
           _findingLocationApiService.getCurrentWeather(
          lat: lat, lon: lon, appId:_appId , units: ApiConstant.UNIT);

    Future<AirPollutionModel>  getAirPollution(
      {required double lat,required double lon}
    )=>_findingLocationApiService.getAirPollution(lat: lat, lon: lon, appId: _appId);
  
}