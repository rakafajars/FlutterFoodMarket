import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/services/api_service.dart';
import 'package:flutter_food_market/services/repository.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
  Repository _repository = ApiService();
  Transaction transaction;

  Future<void> getTransaction() async {
    try {
      emit(
        TransactionLoadInProgress(),
      );

      transaction = await _repository.getTransaction();

      emit(
        TransactionLoadSuccess(transaction: transaction),
      );
    } catch (e) {
      emit(
        TransactionLoadError(
          message: "$e",
        ),
      );
    }
  }

  // Future<void> getTransaction() async {
  //   ApiReturnValue<List<Transaction>> result =
  //       await TransactionService.getTransaction();

  //   if (result.value != null) {
  //     emit(
  //       TransactionLoadSuccess(
  //         transaction: result.value,
  //       ),
  //     );
  //   } else {
  //     emit(
  //       TransactionLoadError(
  //         message: result.message,
  //       ),
  //     );
  //   }
  // }

  // Future<bool> submitTransaction(Transaction transaction) async {
  //   ApiReturnValue<Transaction> result =
  //       await TransactionService.submitTransaction(
  //     transaction,
  //   );

  //   if (result.value != null) {
  //     emit(
  //       TransactionLoadSuccess(
  //         transaction:
  //             (state as TransactionLoadSuccess).transaction + [result.value],
  //       ),
  //     );
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
