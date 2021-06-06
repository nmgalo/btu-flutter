class Planet {
  String name;
  String rotation_period;
  String orbital_period;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  String surface_water;
  String population;
  List<String> residents;
  List<String> films;
  String created;
  String edited;
  String url;

  Planet({
    this.name,
    this.rotation_period,
    this.orbital_period,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surface_water,
    this.population,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  Planet.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    rotation_period = json["rotation_period"];
    orbital_period = json["orbital_period"];
    diameter = json["diameter"];
    climate = json["climate"];
    gravity = json["gravity"];
    terrain = json["terrain"];
    surface_water = json["surface_water"];
    population = json["population"];
    films = json["films"];
    created = json["created"];
    edited = json["edited"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rotation_period'] = this.rotation_period;
    data['orbital_period'] = this.orbital_period;
    data['diameter'] = this.diameter;
    data['climate'] = this.climate;
    data['gravity'] = this.gravity;
    data['terrain'] = this.terrain;
    data['surface_water'] = this.surface_water;
    data['population'] = this.population;
    data['films'] = this.films;
    data['created'] = this.created;
    data['edited'] = this.edited;
    data['url'] = this.url;
    return data;
  }
}
