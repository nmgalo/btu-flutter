import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/utils/app_bloc_observer.dart';
import 'package:todo_app/presentation/utils/app_router.dart';

import 'domain/todo/todo_data_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("An error occurred, please try again later!");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TodoDataCubit>(
                create: (context) => TodoDataCubit(),
              )
            ],
            child: MaterialApp(
              title: "TODO App",
              theme: ThemeData.dark(),
              onGenerateRoute: AppRouter().onGenerateRoute,
            ),
          );
        }
        return  CircularProgressIndicator();
      },
    );
  }
}
