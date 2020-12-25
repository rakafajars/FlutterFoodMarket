import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/rating_stars.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  const FoodListItem({
    Key key,
    @required this.food,
    this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(
            right: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                food.picturePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth -
              182, // 60 width Gambar + 12 margin gambar + 110 Rating Star,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textFontWeight400.copyWith(
                  fontSize: 14,
                  color: '020202'.toColor(),
                ),
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                    .format(
                  food.price,
                ),
                style: textFontWeight400.copyWith(
                  color: greyColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        RatinStars(
          rate: food.rate,
        ),
      ],
    );
  }
}
