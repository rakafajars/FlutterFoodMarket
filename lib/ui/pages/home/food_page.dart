import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/cubit/user/user_cubit.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/detail_food/detail_food_page.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:flutter_food_market/ui/widget/food_cart.dart';
import 'package:flutter_food_market/ui/widget/food_list_item.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:flutter_food_market/ui/widget/rating_stars.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
                          (context.bloc<UserCubit>().state as UserLoadSuccess)
                              .user
                              .picturePath,
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
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (context, state) {
                  return (state is FoodLoadSuccess)
                      ? ListView(
                          padding: EdgeInsets.only(
                            left: defaultMargin,
                          ),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.foods
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              FoodDetailPage(
                                                transaction: Transaction(
                                                  food: e,
                                                  user: (context
                                                              .bloc<UserCubit>()
                                                              .state
                                                          as UserLoadSuccess)
                                                      .user,
                                                ),
                                                onBackButtonPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          },
                                          child: FoodCard(
                                            food: e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        )
                      : Center(
                          child: LoadingIndicator(),
                        );
                },
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
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, state) {
                      if (state is FoodLoadSuccess) {
                        return Builder(
                          builder: (_) {
                            List<Food> foods = state.foods
                                .where(
                                  (element) => element.types.contains(
                                    (selectedIndex == 0)
                                        ? FoodType.new_food
                                        : (selectedIndex == 1)
                                            ? FoodType.popular
                                            : FoodType.recommended,
                                  ),
                                )
                                .toList();
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
                        );
                      } else {
                        return Center(
                          child: LoadingIndicator(),
                        );
                      }
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
