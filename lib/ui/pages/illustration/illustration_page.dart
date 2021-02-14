import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';

class IllustrationPage extends StatefulWidget {
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
  _IllustrationPageState createState() => _IllustrationPageState();
}

class _IllustrationPageState extends State<IllustrationPage>
    with RelativeScale {
  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: sy(130),
            height: sy(130),
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  widget.picturePath,
                ),
              ),
            ),
          ),
          Text(
            widget.title,
            style: textFontWeight400.copyWith(
              fontSize: sy(18),
              color: '020202'.toColor(),
            ),
          ),
          Text(
            widget.subTitle,
            style: textFontWeight300.copyWith(
              fontSize: sy(12),
              color: greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
              bottom: 12,
            ),
            width: sy(165),
            height: sy(40),
            child: CustomeRaisedButton(
              colorsButton: mainColor,
              title: widget.buttonTitle1,
              colorsText: '020202'.toColor(),
              onPressed: widget.buttonTap1,
            ),
          ),
          (widget.buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  width: sy(165),
                  height: sy(40),
                  child: CustomeRaisedButton(
                    colorsButton: greyColor,
                    title: widget.buttonTitle2 ?? "title",
                    colorsText: Colors.white,
                    onPressed: widget.buttonTap2,
                  ),
                ),
        ],
      ),
    );
  }
}
