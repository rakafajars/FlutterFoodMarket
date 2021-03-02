part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoadInProgress extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoadedSuccess extends RegisterState {
  final String message;

  RegisterLoadedSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class RegisterLoadedFailed extends RegisterState {
  final String message;

  RegisterLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
