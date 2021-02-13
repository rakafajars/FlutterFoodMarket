import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/services/user_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserService.signIn(email, password);

    if (result.value != null) {
      emit(
        UserLoadSuccess(
          user: result.value,
        ),
      );
    } else {
      emit(
        UserLoadError(
          message: result.message,
        ),
      );
    }
  }

  Future<void> signUp(User user, String password, {File pictureFile}) async {
    ApiReturnValue<User> result = await UserService.signUp(
      user,
      password,
      pictureFile: pictureFile,
    );

    if (result.value != null) {
      emit(
        UserLoadSuccess(user: result.value),
      );
    } else {
      emit(
        UserLoadError(
          message: result.message,
        ),
      );
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserService.uploadProfilePicture(pictureFile);

    if (result.value != null) {
      emit(
        UserLoadSuccess(
          user: (state as UserLoadSuccess).user.copyWith(
                picturePath:
                    "http://foodmarket-backend.buildwithangga.id/storage/" +
                        result.value,
              ),
        ),
      );
    }
  }
}
