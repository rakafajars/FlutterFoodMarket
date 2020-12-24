import 'package:flutter/material.dart';
import 'package:flutter_food_market/ui/widget/custom_bottom_navbar.dart';
import 'package:supercharged/supercharged.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),
          SafeArea(
            child: Center(
              child: Text('Body'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtonNavBar(),
          ),
        ],
      ),
    );
  }
}
