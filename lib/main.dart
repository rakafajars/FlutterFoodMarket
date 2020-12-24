import 'package:flutter/material.dart';
import 'package:flutter_food_market/ui/pages/home/food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodPage(),
    );
  }
}
