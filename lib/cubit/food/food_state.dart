part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadSuccess extends FoodState {
  final List<Food> foods;

  FoodLoadSuccess({this.foods});

  @override
  List<Object> get props => [foods];
}

class FoodLoadError extends FoodState {
  final String message;

  FoodLoadError({this.message});
  @override
  List<Object> get props => [message];
}
