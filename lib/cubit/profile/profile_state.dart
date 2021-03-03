part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadInProgress extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadedSuccess extends ProfileState {
  final User user;

  ProfileLoadedSuccess(
    this.user,
  );

  @override
  List<Object> get props => [user];
}

class ProfileLoadedFailed extends ProfileState {
  final String message;

  ProfileLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
