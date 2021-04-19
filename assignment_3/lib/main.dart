import 'package:first_app/planets.dart';
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
      home: Scaffold(body: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 500) {
          return PlanetsPortrait();
        } else {
          return PlanetsLandscape();
        }
      },
    );
  }
}

class PlanetsPortrait extends StatefulWidget {
  @override
  _PlanetsPortraitState createState() => _PlanetsPortraitState();
}

class _PlanetsPortraitState extends State<PlanetsPortrait> {
  int selectedItem = 0;

  Widget getSwitcherButtons(List<Map<String, String>> items) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      list.add(SizedBox(
        width: (MediaQuery.of(context).size.width / planets.length) - 25,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
          ),
          onPressed: () {
            setState(() => selectedItem = i);
          },
          child: Text(items[i].values.first),
        ),
      ));
    }
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  child: getSwitcherButtons(planets),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetsLandscape extends StatefulWidget {
  @override
  _PlanetsLandscapeState createState() => _PlanetsLandscapeState();
}

class _PlanetsLandscapeState extends State<PlanetsLandscape> {
  int selectedItem = 0;

  Widget getSwitcherButtons(List<Map<String, String>> items) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      list.add(Padding(
        padding: EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
          ),
          onPressed: () {
            setState(() => selectedItem = i);
          },
          child: Text(items[i].values.first),
        ),
      ));
    }
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image.network(
                planets[selectedItem].values.last,
                fit: BoxFit.fitHeight,
                width: 300.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  child: getSwitcherButtons(planets),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
