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

class UpdatePhotoProfileLoadInProgress extends UpdateProfileState {
  @override
  List<Object> get props => [];
}

class UpdatePhotoProfileLoadedSuccess extends UpdateProfileState {
  final String message;

  UpdatePhotoProfileLoadedSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class UpdatePhotoProfileLoadedFailed extends UpdateProfileState {
  final String message;

  UpdatePhotoProfileLoadedFailed(this.message);
  @override
  List<Object> get props => [message];
}
