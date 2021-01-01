import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:flutter_food_market/ui/widget/food_cart.dart';
import 'package:flutter_food_market/ui/widget/food_list_item.dart';
import 'package:flutter_food_market/ui/widget/rating_stars.dart';
import 'package:supercharged/supercharged.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
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
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(
                  left: defaultMargin,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockFoods
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.only(right: defaultMargin),
                              child: FoodCard(
                                food: e,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            //// List OF Fod (Tabs)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    title: [
                      'New Taste',
                      'Popular',
                      'Recomended',
                    ],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Builder(
                    builder: (_) {
                      List<Food> foods = (selectedIndex == 0)
                          ? mockFoods
                          : (selectedIndex == 1)
                              ? []
                              : [];

                      return Column(
                        children: foods
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                  defaultMargin,
                                  0,
                                  defaultMargin,
                                  16,
                                ),
                                child: FoodListItem(
                                  pictureFood: e.picturePath,
                                  pictureNameFood: e.name,
                                  priceFood: e.price,
                                  itemWidth: listItemWidth,
                                  childCustom: RatinStars(
                                    rate: e.rate,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        )
      ],
    );
  }
}
