import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => HomeScreen(userID: "1"));
    } else {
      return null;
    }
  }
}
