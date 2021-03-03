part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutLoadInProgress extends LogoutState {
  @override
  List<Object> get props => [];
}

class LogoutLoadedSuccess extends LogoutState {
  final String message;

  LogoutLoadedSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class LogoutLoadedFailed extends LogoutState {
  final String message;

  LogoutLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
