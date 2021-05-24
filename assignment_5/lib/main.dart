import 'package:assignment_5/presentation/arch/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/app_bloc_observer.dart';
import 'domain/user/user_data.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserData>(
          create: (context) => UserData(),
        ),
      ],
      child: MaterialApp(
        title: 'App',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    ),
  );
}
