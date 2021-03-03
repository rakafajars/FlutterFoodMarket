part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadInProgress extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadSuccess extends FoodState {
  final Food food;

  FoodLoadSuccess({this.food});

  @override
  List<Object> get props => [food];
}

class FoodLoadError extends FoodState {
  final String message;

  FoodLoadError({this.message});
  @override
  List<Object> get props => [message];
}
