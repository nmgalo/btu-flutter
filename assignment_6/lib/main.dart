import 'package:assignment_6/domain/cubits/planets_data_cubit.dart';
import 'package:assignment_6/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PlanetsDataCubit>(
        create: (context) => PlanetsDataCubit(),
      ),
    ],
    child: MaterialApp(
      title: 'App with flutter',
      theme: ThemeData.dark(),
      onGenerateRoute: AppRouter().onGenerateRoute,
    ),
  ));
}
