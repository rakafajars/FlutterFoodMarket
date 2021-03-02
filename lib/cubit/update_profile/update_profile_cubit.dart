import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/post_register.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  Repository _repository = ApiService();

  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<String> updateUser(PostRegister postRegister) async {
    try {
      emit(
        UpdateProfileLoadInProgress(),
      );

      String message = await _repository.updateUser(postRegister);

      emit(
        UpdateProfileLoadedSuccess(message),
      );
    } catch (e) {
      emit(
        UpdateProfileLoadedFailed("$e"),
      );
    }
  }
}
