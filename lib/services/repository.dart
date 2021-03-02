import 'package:flutter_food_market/model/post_register.dart';

abstract class Repository {
  Future<String> loginUser(
    String email,
    String password,
  );

  Future<String> registerUser(
    PostRegister register,
  );

  Future<String> updateUser(
    PostRegister register,
  );
}
