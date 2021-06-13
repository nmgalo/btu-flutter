import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/data/model/todo.dart';

final CollectionReference _todosCollectionReference =
    FirebaseFirestore.instance.collection('todos');

class TodoRepository {
  List<Todo>? todoList = [];

  Future<List<Todo>>? fetchTodos() async {
    List<Todo> todos = [];

    CollectionReference todoReference =
        _todosCollectionReference.doc("1").collection('todos');

    final reference = await todoReference.get();

    for (var doc in reference.docs) {
      var todo = Todo(
        userId: doc['userId'],
        title: doc['title'],
        completed: doc['completed'],
      );

      todos.add(todo);
    }

    return todos;
  }




}
