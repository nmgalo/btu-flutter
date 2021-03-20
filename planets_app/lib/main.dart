import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planets App',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  var planets = [
    {
      "name": "Jupiter",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg"
    },
    {
      "name": "Saturn",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/f/f7/Jewel_of_the_Solar_System.jpg"
    },
    {
      "name": "Mars",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/0/02/OSIRIS_Mars_true_color.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    Widget getSwitcherButtons(List<Map<String, String>> items) {
      List<Widget> list = <Widget>[];
      for (var i = 0; i < items.length; i++) {
        list.add(new ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
          ),
          onPressed: () {
            setState(() => selectedItem = i);
          },
          child: Text(items[i].values.first),
        ));
      }
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Planets"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                planets[selectedItem].values.first,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.network(
                planets[selectedItem].values.last,
                fit: BoxFit.fitHeight,
                height: 350.0,
              ),
              Container(child: getSwitcherButtons(planets)),
            ],
          ),
        ),
      ),
    );
  }
}
