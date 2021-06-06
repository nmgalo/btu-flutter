import 'package:assignment_6/data/models/planet.dart';
import 'package:assignment_6/data/models/planets.dart';
import 'package:dio/dio.dart';

class PlanetsRepository {
  List<Planet> planetsList = [];
  Dio dio = Dio();

  Future<List<Planet>> fetchPlanets() async {
    var response = await dio.get('https://swapi.dev/api/planets/?format=json');
    if (response.statusCode == 200) {
      response.data.forEach((todo) {
        var planetModel = Planets.fromJson(todo);
        planetsList = planetModel as List<Planet>;
        return planetsList;
      });
      return planetsList;
    }
  }
}
