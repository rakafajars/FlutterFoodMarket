import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/rating_stars.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';

class FoodCard extends StatelessWidget {
  final DatumFood food;

  const FoodCard({Key key, this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, screenHeight, screenWidth, sy, sx) {
        return Container(
          width: sy(200),
          height: sy(210),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8,
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 15,
                color: Colors.black12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: sy(140),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      food.picturePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  sy(12),
                  sy(12),
                  sy(12),
                  sy(6),
                ),
                child: Text(
                  food.name,
                  style: textFontWeight400.copyWith(
                    color: '020202'.toColor(),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: sy(12),
                ),
                child: RatinStars(
                  rate: food.rate.toDouble(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
