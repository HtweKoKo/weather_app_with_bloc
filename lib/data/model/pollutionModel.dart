class AirPollutionModel {
  Coord? coord;
 List<CoordList>? coordList;

  AirPollutionModel({this.coord, this.coordList});

  AirPollutionModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['list'] != null) {
      coordList = <CoordList>[];
      json['list'].forEach((v) {
      
        coordList!.add(new CoordList.fromJson(v));
      });
    }
    
  }

 
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class CoordList {
  Main? main;
  Components? components;
  int? dt;

  CoordList({this.main, this.components, this.dt});

  CoordList.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    components = json['components'] != null
        ? new Components.fromJson(json['components'])
        : null;
    dt = json['dt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    if (this.components != null) {
      data['components'] = this.components!.toJson();
    }
    data['dt'] = this.dt;
    return data;
  }
}

class Main {
  int? aqi;

  Main({this.aqi});

  Main.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    return data;
  }
}

class Components {
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  double? nh3;

  Components(
      {this.co,
      this.no,
      this.no2,
      this.o3,
      this.so2,
      this.pm25,
      this.pm10,
      this.nh3});

  Components.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    no = json['no'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    nh3 = json['nh3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co'] = this.co;
    data['no'] = this.no;
    data['no2'] = this.no2;
    data['o3'] = this.o3;
    data['so2'] = this.so2;
    data['pm2_5'] = this.pm25;
    data['pm10'] = this.pm10;
    data['nh3'] = this.nh3;
    return data;
  }
}
// class Autogenerated {
//   Coord? coord;
//   List<CoordList>? list;

//   Autogenerated({this.coord, this.list});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
//     if (json['list'] != null) {
//       list = <CoordList>[];
//       json['list'].forEach((v) {
//         list!.add(CoordList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (coord != null) {
//       data['coord'] = coord!.toJson();
//     }
//     if (list != null) {
//       data['list'] = list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

 