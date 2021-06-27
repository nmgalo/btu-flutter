import 'package:final_app/presentation/screens/home_screen.dart';
import 'package:final_app/presentation/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    } else if (settings.name == "/expenses") {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else {
      return null;
    }
  }
}
