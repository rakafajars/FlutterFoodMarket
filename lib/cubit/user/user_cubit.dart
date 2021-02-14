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
}
