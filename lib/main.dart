import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/ui/pages/payment/payment_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(
        transaction: Transaction(
          food: mockFoods[0],
          user: mockUser,
          quantity: 2,
          total: (mockFoods[0].price * 2 * 1.1).toInt() + 50000,
        ),
      ),
    );
  }
}
