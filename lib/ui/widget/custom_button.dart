import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';

class CustomeButton extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;

  const CustomeButton({
    Key key,
    this.child,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      height: 45,
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: child,
    );
  }
}

class CustomeRaisedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color colorsButton;
  final Color colorsText;

  const CustomeRaisedButton({
    Key key,
    this.title,
    this.onPressed,
    this.colorsButton,
    this.colorsText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      color: colorsButton,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title ?? '-',
        style: textFontWeight500.copyWith(
          color: colorsText,
        ),
      ),
    );
  }
}
