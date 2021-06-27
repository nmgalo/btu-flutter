import 'package:final_app/domain/cubit/expense_data_cubit.dart';
import 'package:final_app/presentation/utils/app_bloc_observer.dart';
import 'package:final_app/presentation/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExpenseDataCubit>(create: (context) => ExpenseDataCubit()),
      ],
      child: MaterialApp(
        title: 'Hello App',
        theme: ThemeData(
          primaryColor: Color(0xFF6200EE),
          primaryColorDark: Color(0xFF512dA8),
          primaryColorLight: Color(0xFFD1C4E9),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
