import 'package:cars_app/screens/create.dart';
import 'package:cars_app/screens/details.dart';
import 'package:cars_app/screens/edit.dart';
import 'package:cars_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      title: "Cars app",
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
        primaryColorDark: Color(0xff512da8),
        primaryColorLight: Color(0xffD1C4E9),
        accentColor: Color(0xffFFC107),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xff212121),
          ),
          bodyText2: TextStyle(
            color: Color(0xff757575),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              Color(0xffffffff),
            ),
            backgroundColor: MaterialStateProperty.all(
              Color(0xff673AB7),
            ),
          ),
        ),
      ),
      routes: {
        Home.routeName: (context) => Home(),
        Details.routeName: (context) => Details(),
        Create.routeName: (context) => Create(),
        Edit.routeName: (context) => Edit(),
      },
    ),
  );
}
