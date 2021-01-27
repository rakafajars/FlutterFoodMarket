part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionLoadSuccess extends TransactionState {
  final List<Transaction> transaction;

  TransactionLoadSuccess({this.transaction});
  @override
  List<Object> get props => [transaction];
}

class TransactionLoadError extends TransactionState {
  final String message;

  TransactionLoadError({this.message});
  @override
  List<Object> get props => [message];
}
