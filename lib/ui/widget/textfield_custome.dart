import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';

class CustomeTextFieldTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry margin;

  const CustomeTextFieldTitle({
    Key key,
    this.title,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      child: Text(
        title,
        style: textFontWeight500.copyWith(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

class CustomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle hintFieldStyle;
  final String hintFieldText;

  const CustomeTextField({
    Key key,
    this.controller,
    this.hintFieldStyle,
    this.hintFieldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: hintFieldStyle,
          hintText: hintFieldText,
        ),
      ),
    );
  }
}
