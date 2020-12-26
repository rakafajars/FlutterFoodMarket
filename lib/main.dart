import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/ui/pages/auth/sign_in_page.dart';
import 'package:get/get.dart';

import 'ui/pages/detail_food/detail_food_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDetailPage(
        transaction: Transaction(
          food: mockFoods[0],
        ),
      ),
    );
  }
}
