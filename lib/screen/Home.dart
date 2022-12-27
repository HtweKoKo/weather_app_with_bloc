import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/searchlocation/search_location_bloc.dart';
import 'package:weather_app/data/model/FindingLocation.dart';
import 'package:weather_app/screen/weatherDetail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  final SearchLocationBloc _searchLocationBloc = SearchLocationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchLocationBloc,
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text("Weather"))),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    suffixIcon:
                        IconButton(onPressed: () {
                        _searchLocationBloc.add(Searchlocatione(_controller.text));
                        }, icon: Icon(Icons.search)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            BlocBuilder<SearchLocationBloc, SearchLocationState>(
                builder: (contextk, state) {
              if (state is SearchLocationLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SearchLocationSuccess) {
                List<FindingLocation> cities = state.locations;
                return Expanded(
                  child: ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: ((context, index) {
                        FindingLocation city = cities[index];
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=>WeatherDetail(lat: city.lat ?? 0,lon: city.lon ?? 0,))
                            );
                          },
                          title: Text(city.name ?? ""),
                          subtitle: Text(city.country ?? ""),
                        );
                      })),
                );
              }
              return SizedBox();
            })
          ],
        ),
      ),
    );
  }
}
