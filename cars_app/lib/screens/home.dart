import 'package:cars_app/data/repository/car_repository.dart';
import 'package:cars_app/screens/create.dart';
import 'package:cars_app/screens/details.dart';
import 'package:cars_app/screens/edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = "/";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var cars = CarRepository().getAllCars();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(
                    context,
                    Create.routeName,
                  ).then((value) =>
                      setState(() => cars = CarRepository().getAllCars()))),
        ],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Details.routeName,
                arguments: cars[index].id,
              ).then((value) =>
                  setState(() => cars = CarRepository().getAllCars()));
            },
            onLongPress: () => Navigator.pushNamed(
              context,
              Edit.routeName,
              arguments: cars[index].id,
            ).then(
                (value) => setState(() => cars = CarRepository().getAllCars())),
            child: Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.png',
                    image: cars[index].imageUrl,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        cars[index].brand + " " + cars[index].model,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
