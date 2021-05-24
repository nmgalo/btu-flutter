import 'package:assignment_5/presentation/home/home_screen.dart';
import 'package:assignment_5/presentation/todo/add_todo_screen.dart';
import 'package:assignment_5/presentation/todo/todo_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (_) => Home(),
      );
    } else if (settings.name == '/todo') {
      var userId = settings.arguments as String;

      return MaterialPageRoute(
        builder: (_) => Todo(),
      );
    } else if (settings.name == AddTodo.routeName) {
      var userId = settings.arguments as String;

      return MaterialPageRoute(
        builder: (_) => AddTodo(
          userId: userId,
        ),
      );
    } else {
      return null;
    }
  }
}
