import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/user.dart';

class UserService {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(
      Duration(
        milliseconds: 500,
      ),
    );

    return ApiReturnValue(
      value: mockUser,
      // message: 'Wrong Email or Password',
    );
  }
}
