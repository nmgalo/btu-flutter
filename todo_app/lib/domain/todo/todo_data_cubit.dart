import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/data/repository/todo_repository.dart';

part 'todo_data_state.dart';

class TodoDataCubit extends Cubit<TodoDataState> {
  TodoDataCubit() : super(TodoDataInitial());

  final todoRepo = TodoRepository();

  Future<void> getTodoData() async {
    try {
      var list = await todoRepo.fetchTodos();
      emit(TodoDataLoaded(todoList: list!));
    } catch (e) {
      emit(TodoDataError(message: e.toString()));
    }
  }
}
