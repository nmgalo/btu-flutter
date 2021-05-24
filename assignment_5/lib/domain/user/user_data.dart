import 'package:assignment_5/data/dto/User.dart';
import 'package:assignment_5/data/repo/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserData extends Cubit<UserDataState> {
  final userRepository = UserRepository();

  UserData() : super(UserDataInitial());

  Future<void> getUserData() async {
    try {
      var list = await userRepository.getUsers();
      emit(UserDataLoaded(
        users: list,
      ));
    } catch (e) {
      emit(UserDataError(
        message: e.toString(),
      ));
    }
  }
}
