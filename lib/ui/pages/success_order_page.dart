import 'package:flutter/material.dart';
import 'package:flutter_food_market/ui/pages/illustration/illustration_page.dart';
import 'package:flutter_food_market/ui/pages/main_page.dart';
import 'package:get/get.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: 'You’ve Made Order',
        subTitle: 'Just stay at home while we are\npreparing your best foods',
        buttonTitle1: 'Order the Foods',
        buttonTap1: () {
          Get.offAll(
            MainPage(),
          );
        },
        picturePath: 'assets/bike.png',
        buttonTitle2: 'View My Order',
        buttonTap2: () {
          Get.offAll(
            MainPage(
              initialPage: 1,
            ),
          );
        },
      ),
    );
  }
}
