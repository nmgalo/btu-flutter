import 'package:assignment_6/data/models/planet.dart';

class Planets {
  int count;
  String next;
  String previous;
  List<Planet> results;

  Planets.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    next = json["next"];
    previous = json["previous"];
    results = json["results"];
  }
}
