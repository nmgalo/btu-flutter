part of 'planets_data_cubit.dart';

abstract class PlanetsDataState extends Equatable {
  const PlanetsDataState();
}

class PlanetsDataInitial extends PlanetsDataState {
  @override
  List<Object> get props => [];
}

class PlanetsDataLoaded extends PlanetsDataState {
  final List<Planet> planetsList;

  PlanetsDataLoaded({this.planetsList});

  @override
  List<Object> get props => [planetsList];
}

class PlanetsDataError extends PlanetsDataState {
  final String message;

  PlanetsDataError({this.message});

  @override
  List<Object> get props => [message];
}
