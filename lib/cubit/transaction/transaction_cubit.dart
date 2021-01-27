import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/services/transaction_service.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionService.getTransaction();

    if (result.value != null) {
      emit(
        TransactionLoadSuccess(
          transaction: result.value,
        ),
      );
    } else {
      emit(
        TransactionLoadError(
          message: result.message,
        ),
      );
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionService.submitTransaction(
      transaction,
    );

    if (result.value != null) {
      emit(
        TransactionLoadSuccess(
          transaction:
              (state as TransactionLoadSuccess).transaction + [result.value],
        ),
      );
      return true;
    } else {
      return false;
    }
  }
}
