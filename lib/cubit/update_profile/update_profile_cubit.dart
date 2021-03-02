import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/post_register.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  Repository _repository = ApiService();

  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateUser(PostRegister postRegister) async {
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

  Future<void> updatePhotoUser(String filePath) async {
    try {
      emit(
        UpdatePhotoProfileLoadInProgress(),
      );

      String message = await _repository.updatePhotoUser(filePath);

      emit(
        UpdatePhotoProfileLoadedSuccess(message),
      );
    } catch (e) {
      emit(
        UpdatePhotoProfileLoadedFailed("$e"),
      );
    }
  }
}
