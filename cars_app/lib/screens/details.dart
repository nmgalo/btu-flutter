import 'package:cars_app/data/repository/car_repository.dart';
import 'package:cars_app/model/car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments as int;
    Car car = CarRepository().getById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              CarRepository().removeCarById(id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: car.imageUrl,
                width: MediaQuery.of(context).size.width - 20,
                height: 300,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Brand: "),
                        Text(car.brand),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Model: "),
                        Text(car.model),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Year: "),
                        Text(
                          car.year.toString(),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
