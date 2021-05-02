import 'package:cars_app/data/repository/car_repository.dart';
import 'package:cars_app/model/car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  static const routeName = "/create";

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final TextEditingController brand = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController imageSource = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: brand,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Please enter Brand",
                      labelText: "Brand",
                    ),
                    validator: (value) {
                      return (value.isEmpty || value == null)
                          ? "Please enter Brand"
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: model,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Please enter Model",
                      labelText: "Model",
                    ),
                    validator: (value) => (value.isEmpty || value == null)
                        ? "Please enter Model"
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: year,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Please enter Year",
                      labelText: "Year",
                    ),
                    validator: (value) => (int.tryParse(value) == null ||
                            int.tryParse(value) <= 0 ||
                            value.isEmpty ||
                            value == null)
                        ? "Please enter Year"
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Please enter Description",
                      labelText: "Description",
                    ),
                    validator: (value) => (value.isEmpty || value == null)
                        ? "Please enter Description"
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: imageSource,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Please enter Image URL",
                      labelText: "Image",
                    ),
                    validator: (value) => (value.isEmpty || value == null)
                        ? "Please enter Image URL"
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Car car = Car(
                                id: CarRepository().getNextCarId(),
                                brand: brand.text,
                                model: model.text,
                                year: int.tryParse(year.text),
                                description: description.text,
                                imageUrl: imageSource.text,
                              );
                              CarRepository().createCar(car);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Create"),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xffbfbfbf),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
