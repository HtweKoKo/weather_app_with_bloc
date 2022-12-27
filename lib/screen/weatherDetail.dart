import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Constant.dart';
import 'package:weather_app/bloc/airpollution/air_pollution_bloc.dart';
import 'package:weather_app/data/model/curretWeather.dart';
import 'package:weather_app/data/model/pollutionModel.dart';

import '../bloc/current_weather/current_weather_bloc.dart';
import '../bloc/current_weather/current_weather_state.dart';
import '../data/model/curretWeather.dart';

class WeatherDetail extends StatefulWidget {
  final double lat;
  final double lon;
  WeatherDetail({required this.lat, required this.lon});

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  CurrentWeatherBloc _currentWeatherBloc = CurrentWeatherBloc();
  AirPollutionBloc _airPollutionBloc = AirPollutionBloc();

  @override
  void initState() {
    super.initState();
    _currentWeatherBloc.add(CurrentWeather2(widget.lat, widget.lon));
    _airPollutionBloc.add(AirPollution(widget.lat, widget.lon));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _currentWeatherBloc,
        ),
        BlocProvider(
          create: (context) => _airPollutionBloc,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff283593),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xff5C6BC0), Color(0xff3949AB), Color(0xff283593)],
          )),
          child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
            builder: (context, state) {
              if (state is CurrentWeatherLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is CurrentWeatherSuccess) {
                CurrentWeatherModel currentWeather = state.currentWeather;
                var weather = currentWeather.weather![0];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentWeather.name ?? "",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    timeWeather(
                      currentWeather.dt ?? 0,
                    ),
                    tempWidget(currentWeather, weather),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${weather.main}",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<AirPollutionBloc, AirPollutionState>(
                      builder: (context, state) {
                        if(state is AirPollutionLoading){
                          return CircularProgressIndicator();
                        }
                      else  if(state is AirPollutionSuccess){
                        var aa = state.airPollutionModel.coordList?[0].main!.aqi;
                        return Text("$aa");
                       
                         
                        }
                       else if(state is AirPollutionfail){
                        return Text(state.errorMessage);
                       }
                        return SizedBox();
                      },
                    )
                  ],
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget timeWeather(int time) {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(time * 1000);
    Text decide = (dateTime.hour >= 12)
        ? Text(
            "Updated:  ${dateTime.hour}:${dateTime.minute} PM",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
        : Text(
            "Updated:  ${dateTime.hour}:${dateTime.minute} AM",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          );
    return decide;
  }

  Widget tempWidget(CurrentWeatherModel currentWeatherModel, Weather weather) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
              child: CachedNetworkImage(
                  imageUrl: ApiConstant.iconLink(weather.icon))),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            "${currentWeatherModel.main!.temp}",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Max: ${currentWeatherModel.main!.tempMax}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Min: ${currentWeatherModel.main!.tempMin}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//  Text(
//                           "Hello",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         );
