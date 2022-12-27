import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/bloc/searchlocation/search_location_bloc.dart';
import 'package:weather_app/screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CurrentWeatherBloc _currentWeatherBloc = CurrentWeatherBloc();
   SearchLocationBloc _searchLocationBloc = SearchLocationBloc();
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:   Home() 
    );
     
}
}
