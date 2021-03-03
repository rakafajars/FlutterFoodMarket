import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';
part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Repository _repository = ApiService();
  Food food;

  Future<void> getFood({
    @required String typeFood,
  }) async {
    try {
      emit(
        FoodLoadInProgress(),
      );

      food = await _repository.getFood(typeFood);

      emit(
        FoodLoadSuccess(
          food: food,
        ),
      );
    } catch (e) {
      emit(
        FoodLoadError(
          message: "$e",
        ),
      );
    }
  }
}
