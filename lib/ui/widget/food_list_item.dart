import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

class FoodListItem extends StatelessWidget {
  final String pictureFood;
  final String pictureNameFood;
  final int priceFood;
  final double itemWidth;
  final Widget childCustom;

  const FoodListItem({
    Key key,
    this.itemWidth,
    @required this.childCustom,
    this.pictureFood,
    this.pictureNameFood,
    this.priceFood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, screenHeight, screenWidth, sy, sx) {
        return Row(
          children: [
            Container(
              width: sy(60),
              height: sy(60),
              margin: EdgeInsets.only(
                right: sy(12),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    pictureFood,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: itemWidth -
                  sy(182), // 60 width Gambar + 12 margin gambar + 110 Rating Star,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pictureNameFood,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textFontWeight400.copyWith(
                      fontSize: sy(12),
                      color: '020202'.toColor(),
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(
                      priceFood,
                    ),
                    style: textFontWeight400.copyWith(
                      color: greyColor,
                      fontSize: sy(13),
                    ),
                  ),
                ],
              ),
            ),
            childCustom,
          ],
        );
      },
    );
  }
}
