part of 'checkout_cubit.dart';

abstract class CheckoutState extends Equatable {}

class CheckoutInitial extends CheckoutState {
  @override
  List<Object> get props => [];
}

class CheckoutLoadInProgress extends CheckoutState {
  @override
  List<Object> get props => [];
}

class CheckoutLoadedSuccess extends CheckoutState {
  final String message;

  CheckoutLoadedSuccess({this.message});
  @override
  List<Object> get props => [message];
}

class CheckoutLoadedError extends CheckoutState {
  final String message;

  CheckoutLoadedError({this.message});
  @override
  List<Object> get props => [message];
}
