import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:supercharged/supercharged.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String picturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  const IllustrationPage(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      @required this.buttonTap1,
      this.buttonTitle2,
      this.buttonTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  picturePath,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: textFontWeight400.copyWith(
              fontSize: 20,
              color: '020202'.toColor(),
            ),
          ),
          Text(
            subTitle,
            style: textFontWeight300.copyWith(
              fontSize: 14,
              color: greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
              bottom: 12,
            ),
            width: 200,
            height: 45,
            child: CustomeRaisedButton(
              colorsButton: mainColor,
              title: buttonTitle1,
              colorsText: '020202'.toColor(),
              onPressed: buttonTap1,
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  height: 45,
                  width: 200,
                  child: CustomeRaisedButton(
                    colorsButton: greyColor,
                    title: buttonTitle2 ?? "title",
                    colorsText: Colors.white,
                    onPressed: buttonTap2,
                  ),
                ),
        ],
      ),
    );
  }
}
