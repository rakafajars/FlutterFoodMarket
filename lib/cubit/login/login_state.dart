part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadInProgress extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadedSuccess extends LoginState {
  final String message;

  LoginLoadedSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class LoginLoadedFailed extends LoginState {
  final String message;

  LoginLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
