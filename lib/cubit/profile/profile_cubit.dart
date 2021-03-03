import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Repository _repository = ApiService();
  User user;

  Future<void> getUSer() async {
    try {
      emit(
        ProfileLoadInProgress(),
      );

      user = await _repository.getUser();

      emit(
        ProfileLoadedSuccess(user),
      );
    } catch (e) {
      emit(
        ProfileLoadedFailed("$e"),
      );
    }
  }
}
