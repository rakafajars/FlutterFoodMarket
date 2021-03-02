import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  Repository _repository = ApiService();
  LoginCubit() : super(LoginInitial());

  // ignore: missing_return
  Future<void> loginUser(String username, String password) async {
    try {
      emit(
        LoginLoadInProgress(),
      );

      String message = await _repository.loginUser(
        username,
        password,
      );

      emit(
        LoginLoadedSuccess(message),
      );
    } catch (e) {
      emit(
        LoginLoadedFailed('$e'),
      );
    }
  }
}
