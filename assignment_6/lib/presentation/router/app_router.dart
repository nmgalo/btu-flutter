import 'package:assignment_6/presentation/screens/detailed/detailed_screen.dart';
import 'package:assignment_6/presentation/screens/home/planets_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => PlanetsScreen());
    } else if (settings.name == '/detailed-screen') {
      var planetURL = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => DetailedScreen(planetURL: planetURL));
    } else {
      return null;
    }
  }
}
