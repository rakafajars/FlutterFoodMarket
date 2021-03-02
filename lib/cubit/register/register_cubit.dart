import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/post_register.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  Repository _repository = ApiService();
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(PostRegister postRegister) async {
    try {
      emit(
        RegisterLoadInProgress(),
      );

      String message = await _repository.registerUser(postRegister);

      emit(
        RegisterLoadedSuccess(message),
      );
    } catch (e) {
      emit(
        RegisterLoadedFailed("$e"),
      );
    }
  }
}
