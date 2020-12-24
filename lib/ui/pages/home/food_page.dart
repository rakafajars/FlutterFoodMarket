import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/food_cart.dart';
import 'package:supercharged/supercharged.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Food Market',
                        style: textFontWeight500.copyWith(
                          fontSize: 22,
                          color: '020202'.toColor(),
                        ),
                      ),
                      Text(
                        'Let’s get some foods',
                        style: textFontWeight300.copyWith(
                          fontSize: 14,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn.idntimes.com/content-images/community/2020/11/14-b1fe04b0ceee0bcd7cd47663ff17b2e9.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //// List Of Food
            FoodCard(),
            //// List OF Fod (Tabs)
          ],
        )
      ],
    );
  }
}
