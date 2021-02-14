import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:relative_scale/relative_scale.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, screenHeight, screenWidth, sy, sx) {
        return SpinKitFadingCircle(
          size: sy(45),
          color: mainColor,
        );
      },
    );
  }
}
