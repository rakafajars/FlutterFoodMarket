import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  Repository _repository = ApiService();

  CheckoutCubit() : super(CheckoutInitial());

  Future<void> postCheckout({
    String foodId,
    String quantity,
    double total,
    String status,
  }) async {
    try {
      emit(
        CheckoutLoadInProgress(),
      );

      String message = await _repository.postCheckout(
        foodId: foodId,
        quantity: quantity,
        status: status,
        total: total,
      );
      emit(
        CheckoutLoadedSuccess(
          message: message,
        ),
      );
    } catch (e) {
      emit(
        CheckoutLoadedError(message: "$e"),
      );
    }
  }
}
