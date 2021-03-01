import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
}
