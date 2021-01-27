import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/services/food_service.dart';
part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodService.getFood();
    if (result.value != null) {
      emit(
        FoodLoadSuccess(
          foods: result.value,
        ),
      );
    } else {
      emit(
        FoodLoadError(
          message: result.message,
        ),
      );
    }
  }
}
