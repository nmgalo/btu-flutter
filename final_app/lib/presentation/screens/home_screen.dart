import 'package:final_app/domain/cubit/expense_data_cubit.dart';
import 'package:final_app/presentation/utils/widgets/create_expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ExpenseDataCubit, ExpenseDataState>(
        builder: (context, state) {
          if (state is ExpenseDataInitial) {
            BlocProvider.of<ExpenseDataCubit>(context).readAll();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseDataLoaded) {
            return Stack(
              children: [
                Image.asset('assets/images/bkg.png'),
                Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 100.0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Personal expenses',
                            style: TextStyle(fontSize: 25),
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                            color: Color(0xFF267b7b),
                            shape: CircleBorder(),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return CreateExpense();
                                },
                              );
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 48,
                            ),
                            child: Text(
                              "1200 \$",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF267b7b),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.expenses.length,
                        itemBuilder: (context, index) {
                          var expense = state.expenses[index];
                          return Card(
                            elevation: 4,
                            child: ListTile(
                              title: Text(expense.title),
                              subtitle: Text(expense.date),
                              trailing: Text('${expense.amount} \$'),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: Text('An error occurred, Please try again later'),
            );
          }
        },
        listener: (context, state) {
          if (state is ExpenseDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message.toString()),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
