import 'package:assignment_6/data/models/planet.dart';
import 'package:assignment_6/data/models/planets.dart';
import 'package:assignment_6/data/repository/planets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'planets_data_state.dart';

class PlanetsDataCubit extends Cubit<PlanetsDataState> {
  PlanetsDataCubit() : super(PlanetsDataInitial());

  final planetsRepo = PlanetsRepository();

  Future<void> getPlanetsData() async {
    try {
      var list = await planetsRepo.fetchPlanets();
      emit(PlanetsDataLoaded(planetsList: list));
    } catch (e) {
      emit(PlanetsDataError(message: e.toString()));
    }
  }

}
