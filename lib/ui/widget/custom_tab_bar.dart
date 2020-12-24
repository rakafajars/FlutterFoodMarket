import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:supercharged/supercharged.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> title;
  final Function(int) onTap;

  const CustomTabBar({
    Key key,
    this.selectedIndex,
    @required this.title,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: title
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultMargin,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) {
                              onTap(title.indexOf(e));
                            }
                          },
                          child: Text(
                            e,
                            style: (title.indexOf(e) == selectedIndex)
                                ? textFontWeight500.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )
                                : textFontWeight400.copyWith(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          margin: EdgeInsets.only(
                            top: 13,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.5),
                            color: (title.indexOf(e) == selectedIndex)
                                ? '020202'.toColor()
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
