import 'package:equatable/equatable.dart';
import 'package:final_app/data/models/expense.dart';
import 'package:final_app/data/repository/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_data_state.dart';

class ExpenseDataCubit extends Cubit<ExpenseDataState> {
  ExpenseDataCubit() : super(ExpenseDataInitial());

  final expenseRepository = ExpenseRepository();

  Future<void> readAll() async {
    emit(ExpenseDataInitial());

    try {
      var expenses = await expenseRepository.getAll();
      emit(ExpenseDataLoaded(
        expenses: expenses,
      ));
    } catch (e) {
      emit(ExpenseDataError(
        message: e.toString(),
      ));
    }
  }

  Future<void> create(Expense expense) async {
    emit(ExpenseDataInitial());

    try {
      await expenseRepository.create(expense);
    } catch (e) {
      emit(ExpenseDataError(
        message: e.toString(),
      ));
    }
  }

  Future<void> update(Expense expense, String docId) async {
    emit(ExpenseDataInitial());
    try {
      await expenseRepository.update(expense, docId);
    } catch (e) {
      emit(ExpenseDataError(
        message: e.toString(),
      ));
    }
  }

  Future<void> delete(String docId) async {
    emit(ExpenseDataInitial());
    try {
      await expenseRepository.delete(docId);
    } catch (e) {
      emit(ExpenseDataError(
        message: e.toString(),
      ));
    }
  }
}
