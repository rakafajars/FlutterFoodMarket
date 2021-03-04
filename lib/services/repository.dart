import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/post_register.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/model/user.dart';

abstract class Repository {
  Future<String> loginUser(
    String email,
    String password,
  );

  Future<String> postLogoutUser();

  Future<String> registerUser(
    PostRegister register,
  );

  Future<String> updateUser(
    PostRegister register,
  );

  Future<String> updatePhotoUser(
    String filePath,
  );

  Future<User> getUser();

  Future<Food> getFood(String typeFood);

  Future<Transaction> getTransaction();

  Future<String> postCheckout({
    String foodId,
    String quantity,
    double total,
    String status,
  });
}
