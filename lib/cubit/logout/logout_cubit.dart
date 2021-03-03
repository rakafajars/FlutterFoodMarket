import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  Repository _repository = ApiService();

  LogoutCubit() : super(LogoutInitial());

  Future<void> logoutUser() async {
    try {
      emit(
        LogoutLoadInProgress(),
      );

      String message = await _repository.postLogoutUser();

      emit(
        LogoutLoadedSuccess(message),
      );
    } catch (e) {
      emit(
        LogoutLoadedFailed("$e"),
      );
    }
  }
}
