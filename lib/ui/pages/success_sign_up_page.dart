import 'package:flutter/material.dart';
import 'package:flutter_food_market/ui/pages/illustration/illustration_page.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: 'Yeay! Completed',
        subTitle: 'Now you are able to order\nsome foods as a self-reward',
        buttonTap1: () {},
        picturePath: 'assets/food_wishes.png',
        buttonTitle1: 'Find Foods',
      ),
    );
  }
}
