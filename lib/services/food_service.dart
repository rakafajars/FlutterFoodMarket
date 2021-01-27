import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/food.dart';

class FoodService {
  static Future<ApiReturnValue<List<Food>>> getFood() async {
    await Future.delayed(Duration(
      milliseconds: 500,
    ),);

    return ApiReturnValue(value: mockFoods);
  }
}