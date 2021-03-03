import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_food_market/ui/pages/auth/sign_in_page.dart';
import 'package:flutter_food_market/ui/pages/main_page.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_food_market/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with RelativeScale {
  // Timer untuk splashScreen
  startSplashScreen() async {
    String token = await getTokenPreference();
    var duration = const Duration(
      seconds: 2,
    );
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => token != null ? MainPage() : InitialSignInPage(),
          ),
        );
      },
    );
  }

  Future<String> getTokenPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);
    return Scaffold(
      backgroundColor: 'FFC700'.toColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: sy(60),
              height: sy(60),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/shop1.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: sy(8),
            ),
            Text(
              'FoodMarket',
              style: textFontWeight500.copyWith(
                fontSize: sy(18),
                color: '020202'.toColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
