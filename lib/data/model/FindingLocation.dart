class FindingLocation {
  String? name;
  LocalNames? localNames;
  double? lat;
  double ?lon;
  String? country;
  String? state;

  FindingLocation(
      {this.name,
      this.localNames,
      this.lat,
      this.lon,
      this.country,
      this.state});

  FindingLocation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? new LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.localNames != null) {
      data['local_names'] = this.localNames?.toJson();
    }
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    data['state'] = this.state;
    return data;
  }
}

class LocalNames {
  String? fr;
  String? sv;
  String? et;
  String? ru;
  String? ur;
  String? uk;
  String? de;
  String? my;
  String? ja;
  String? es;
  String? zh;
  String? en;
  String? ascii;
  String? featureName;
  String? sr;

  LocalNames(
      {this.fr,
      this.sv,
      this.et,
      this.ru,
      this.ur,
      this.uk,
      this.de,
      this.my,
      this.ja,
      this.es,
      this.zh,
      this.en,
      this.ascii,
      this.featureName,
      this.sr});

  LocalNames.fromJson(Map<String, dynamic> json) {
    fr = json['fr'];
    sv = json['sv'];
    et = json['et'];
    ru = json['ru'];
    ur = json['ur'];
    uk = json['uk'];
    de = json['de'];
    my = json['my'];
    ja = json['ja'];
    es = json['es'];
    zh = json['zh'];
    en = json['en'];
    ascii = json['ascii'];
    featureName = json['feature_name'];
    sr = json['sr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fr'] = this.fr;
    data['sv'] = this.sv;
    data['et'] = this.et;
    data['ru'] = this.ru;
    data['ur'] = this.ur;
    data['uk'] = this.uk;
    data['de'] = this.de;
    data['my'] = this.my;
    data['ja'] = this.ja;
    data['es'] = this.es;
    data['zh'] = this.zh;
    data['en'] = this.en;
    data['ascii'] = this.ascii;
    data['feature_name'] = this.featureName;
    data['sr'] = this.sr;
    return data;
  }
}
