import 'package:flutter/cupertino.dart';

class AddTodo extends StatelessWidget {
  static const routeName = "/create-todo";

  const AddTodo({
    Key key,
    this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Text("Add TODO");
  }
}
