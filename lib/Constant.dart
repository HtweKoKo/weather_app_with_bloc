import 'package:flutter/cupertino.dart';

class ApiConstant{

  static const BASE_URL ="http://api.openweathermap.org/";
  static const FINDING_LOCATION_ENDPOINT ="geo/1.0/direct";
  static const CURRENT_WEATHER_ENDPOINT ="data/2.5/weather";
  static const APPID ="ca25a197f5e61cd113dda06c7e5fb70c";
  static const AIR_PORLUTION_ENDPOINT ="data/2.5/air_pollution";
  static const UNIT ="metric";
 static iconLink(code){
    return "http://openweathermap.org/img/wn/$code@2x.png";
  }
  
}