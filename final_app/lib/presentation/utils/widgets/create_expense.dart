import 'package:final_app/data/models/expense.dart';
import 'package:final_app/domain/cubit/expense_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateExpense extends StatefulWidget {
  @override
  _CreateExpenseState createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                child: TextFormField(
                  cursorColor: Color(0xf000000),
                  controller: _amountController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Please enter an amount',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    return (value == null || double.tryParse(value) == null)
                        ? 'Please enter valid expense amount!'
                        : null;
                  },
                ),
              ),
              SizedBox(
                child: TextFormField(
                  cursorColor: Color(0xf000000),
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Please enter title',
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please enter valid expense title!'
                        : null;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ExpenseDataCubit>(context).create(
                        Expense(
                          amount:
                              double.parse(_amountController.text.toString()),
                          title: _titleController.text,
                          date: _dateController.text,
                        ),
                      );
                    }

                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
