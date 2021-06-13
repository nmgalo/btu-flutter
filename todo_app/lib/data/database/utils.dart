import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/data/model/todo.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _fireStore.collection('todos');

class Database {
  static String? userId;

  static Future<void> createTodo({required Todo todo}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection('items').doc();
    var data = <String, dynamic>{
      'userId': todo.userId,
      'title': todo.title,
      'completed': todo.completed
    };

    await documentReference
        .set(data)
        .whenComplete(() => print('Date created'))
        .catchError((e) => print('ERROR: ' + e.toString()));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference todosReference =
        _collectionReference.doc(userId).collection('items');
    return todosReference.snapshots();
  }

  Future<void> updateItems({required Todo todo, required String todoId}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection('items').doc(todoId);
    var data = <String, dynamic>{
      'title': todo.title,
      'completed': todo.completed
    };

    await documentReference
        .update(data)
        .whenComplete(() => print('Updated'))
        .catchError((e) => print('ERROR: ' + e.toString()));
  }

  Future<void> deleteItem({required String docId}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userId).collection('items').doc(docId);
    await documentReference
        .delete()
        .whenComplete(() => print('Item deleted'))
        .catchError((e) => print('ERROR: ' + e.toString()));
  }
}
