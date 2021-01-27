import 'package:flutter_food_market/model/api_return_value.dart';
import 'package:flutter_food_market/model/transaction.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction() async {

    await Future.delayed(
      Duration(
        seconds: 3,
      ),
    );

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {

    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );

    return ApiReturnValue(
      value: transaction.copyWith(
        id: 123,
        status: TransactionStatus.pending,
      ),
    );
  }
}
