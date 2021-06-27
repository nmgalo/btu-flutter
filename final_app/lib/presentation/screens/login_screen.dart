import 'package:final_app/domain/cubit/expense_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 32,
                    child: TextFormField(
                      controller: _userID,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        errorStyle: TextStyle(
                          height: 0,
                          color: Colors.transparent,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xf008a5a),
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null) {
                          return "Please enter user ID";
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
