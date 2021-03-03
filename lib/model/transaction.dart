import 'package:equatable/equatable.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/user.dart';

enum TransactionStatus {
  delivered,
  on_delivery,
  pending,
  cancelled,
}

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction({
    this.id,
    this.food,
    this.quantity,
    this.total,
    this.dateTime,
    this.status,
    this.user,
  });

  Transaction copyWith({
    int id,
    Food food,
    int quantity,
    int total,
    DateTime dateTime,
    TransactionStatus status,
    User user,
  }) {
    return Transaction(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        id,
        food,
        quantity,
        total,
        dateTime,
        status,
        user,
      ];
}

List<Transaction> mockTransaction = [
  Transaction(
    id: 1,
    food: mockFoods[1],
    quantity: 10,
    total: (mockFoods[1].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    // user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[2],
    quantity: 2,
    total: (mockFoods[2].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    // user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[3],
    quantity: 10,
    total: (mockFoods[3].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.cancelled,
    // user: mockUser,
  )
];
