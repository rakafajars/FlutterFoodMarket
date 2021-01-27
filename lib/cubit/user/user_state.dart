part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadSuccess extends UserState {
  final User user;

  UserLoadSuccess({this.user});
  @override
  List<Object> get props => [user];
}

class UserLoadError extends UserState {
  final String message;

  UserLoadError({this.message});
  @override
  List<Object> get props => [message];
}
