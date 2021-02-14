import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';

class GeneralPage extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColorButton;
  final EdgeInsetsGeometry paddingListView;

  const GeneralPage({
    Key key,
    this.title = "Title",
    this.subTitle = "Subtitle",
    this.onBackButtonPressed,
    this.child,
    this.backColorButton,
    this.paddingListView,
  }) : super(key: key);

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> with RelativeScale {
  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: widget.backColorButton ?? Colors.white,
            ),
          ),
          SafeArea(
            child: ListView(
              padding: widget.paddingListView,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      width: double.infinity,
                      height: sy(80),
                      color: Colors.white,
                      child: Row(
                        children: [
                          widget.onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (widget.onBackButtonPressed != null) {
                                      widget.onBackButtonPressed();
                                    }
                                  },
                                  child: Container(
                                    width: sy(22),
                                    height: sy(22),
                                    margin: EdgeInsets.only(
                                      right: 26,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/back_arrow.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.title,
                                style: textFontWeight500.copyWith(
                                  fontSize: sy(20),
                                ),
                              ),
                              Text(
                                widget.subTitle,
                                style: textFontWeight300.copyWith(
                                  color: greyColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: sy(22),
                      width: double.infinity,
                      color: "FAFAFC".toColor(),
                    ),
                    widget.child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
