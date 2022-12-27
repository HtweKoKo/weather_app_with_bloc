import 'package:retrofit/http.dart';
import 'package:weather_app/Constant.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/model/FindingLocation.dart';
import 'package:weather_app/data/model/curretWeather.dart';
import 'package:weather_app/data/model/pollutionModel.dart';


part 'findingLocation_apiservice.g.dart';


@RestApi(baseUrl: ApiConstant.BASE_URL)
abstract class FindingLocationApiService{
  factory FindingLocationApiService(Dio dio) => _FindingLocationApiService(dio);

@GET(ApiConstant.FINDING_LOCATION_ENDPOINT)
Future<List<FindingLocation>> searchLocation({@Query("q")required String location,@Query("limit")
 required int limit,@Query("appid") required String appId });


 @GET(ApiConstant.CURRENT_WEATHER_ENDPOINT)
 Future<CurrentWeatherModel> getCurrentWeather({@Query("lat")required double lat,@Query("lon")required double lon,@Query("appid")required String appId,@Query("units")required String units} );

@GET (ApiConstant.AIR_PORLUTION_ENDPOINT)
  Future<AirPollutionModel> getAirPollution({@Query("lat")required double lat,@Query("lon")required double lon,@Query("appid")required String appId} );
}