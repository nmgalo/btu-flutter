import 'package:assignment_6/domain/cubits/planets_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planets App'),
      ),
      body: BlocConsumer<PlanetsDataCubit, PlanetsDataState>(
        listener: (context, state) {
          if (state is PlanetsDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PlanetsDataInitial) {
            BlocProvider.of<PlanetsDataCubit>(context).getPlanetsData();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlanetsDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var planet = state.planetsList[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/detailed-screen', arguments: planet);
                  },
                  title: Text(planet.name),
                  subtitle: Text(planet.climate),
                );
              },
              itemCount: state.planetsList.length,
            );
          } else {
            return Center(
              child: Text('An error occurred, please try again later!!'),
            );
          }
        },
      ),
    );
  }
}
