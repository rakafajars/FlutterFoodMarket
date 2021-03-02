part of 'update_profile_cubit.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();
}

class UpdateProfileInitial extends UpdateProfileState {
  @override
  List<Object> get props => [];
}

class UpdateProfileLoadInProgress extends UpdateProfileState {
  @override
  List<Object> get props => [];
}

class UpdateProfileLoadedSuccess extends UpdateProfileState {
  final String message;

  UpdateProfileLoadedSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class UpdateProfileLoadedFailed extends UpdateProfileState {
  final String message;

  UpdateProfileLoadedFailed(this.message);
  @override
  List<Object> get props => [message];
}
