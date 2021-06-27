import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/data/models/expense.dart';

final CollectionReference _expensesCollectionReference =
    FirebaseFirestore.instance.collection('expenses');

class ExpenseRepository {
  String userId = "1";

  Future<List<Expense>> getAll() async {
    List<Expense> expenses = [];
    final userExpenses = await _expensesCollectionReference
        .doc(userId)
        .collection("expenses")
        .get();

    for (var doc in userExpenses.docs) {
      var expense = Expense(
        title: doc['title'],
        date: doc['date'],
        amount: doc['amount'],
      );
      expense.id = doc['id'];
      expenses.add(expense);
    }
    return expenses;
  }

  Future<void> create(Expense expense) async {
    await _expensesCollectionReference
        .doc(userId)
        .collection('expenses')
        .doc()
        .set(expense.toJson())
        .whenComplete(() => print('Expense created'))
        .catchError((errorMessage) => print(errorMessage));
  }

  Future<void> update(Expense expense, String docId) async {
    await _expensesCollectionReference
        .doc(userId)
        .collection("expenses")
        .doc(docId)
        .update(expense.toJson())
        .whenComplete(() => print("Expense updated"))
        .catchError((e) => print(e));
  }

  Future<void> delete(String docId) async {
    await _expensesCollectionReference
        .doc(userId)
        .collection('expenses')
        .doc(docId)
        .delete()
        .whenComplete(() => print('Expense deleted'))
        .catchError((errorMessage) => throw Exception(errorMessage));
  }
}
