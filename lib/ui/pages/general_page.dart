import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:supercharged/supercharged.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColorButton;

  const GeneralPage({
    Key key,
    this.title = "Title",
    this.subTitle = "Subtitle",
    this.onBackButtonPressed,
    this.child,
    this.backColorButton,
  }) : super(key: key);

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
              color: backColorButton ?? "FAFAFC".toColor(),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: defaultMargin,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? Container(
                                  width: 24,
                                  height: 24,
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
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: textFontWeight500.copyWith(
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                subTitle,
                                style: textFontWeight300.copyWith(
                                  color: greyColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    child ?? SizedBox(),
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
