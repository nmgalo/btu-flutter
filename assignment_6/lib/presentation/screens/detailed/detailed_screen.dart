import 'package:flutter/cupertino.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key key, this.planetURL}) : super(key: key);
  final String planetURL;

  @override
  Widget build(BuildContext context) {
    return Text("Block provider");
  }
}
