import 'package:cars_app/data/repository/car_repository.dart';
import 'package:cars_app/model/car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  static const routeName = "/edit";

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments as int;
    Car car = CarRepository().getById(id);

    final _formKey = GlobalKey<FormState>();

    final TextEditingController brand = TextEditingController(text: car.brand);
    final TextEditingController model = TextEditingController(text: car.model);
    final TextEditingController year =
        TextEditingController(text: car.year.toString());
    final TextEditingController description =
        TextEditingController(text: car.description);
    final TextEditingController imageSource =
        TextEditingController(text: car.imageUrl);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit car"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
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
                      hintText: "Brand",
                      labelText: "Brand",
                    ),
                    validator: (value) {
                      return (value.isEmpty || value == null)
                          ? "Brand field is required"
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
                      hintText: "Model",
                      labelText: "Model",
                    ),
                    validator: (value) {
                      return (value.isEmpty || value == null)
                          ? "Model field is required"
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: year,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Year",
                      labelText: "Year",
                    ),
                    validator: (value) {
                      return (value.isEmpty || value == null)
                          ? "Year field is required"
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Description",
                      labelText: "Description",
                    ),
                    validator: (value) {
                      return (value.isEmpty || value == null)
                          ? "Description field is required"
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: imageSource,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Image",
                      labelText: "Image",
                    ),
                    validator: (value) {
                      return (value.isEmpty || value == null)
                          ? "Image field is required"
                          : null;
                    },
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
                                id: id,
                                brand: brand.text,
                                model: model.text,
                                year: int.tryParse(year.text),
                                description: description.text,
                                imageUrl: imageSource.text,
                              );
                              CarRepository().updateCar(id, car);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Edit"),
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
