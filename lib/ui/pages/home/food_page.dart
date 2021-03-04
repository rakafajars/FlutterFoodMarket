import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/model/food.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/detail_food/detail_food_page.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:flutter_food_market/ui/widget/food_cart.dart';
import 'package:flutter_food_market/ui/widget/food_list_item.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:flutter_food_market/ui/widget/rating_stars.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> with RelativeScale {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    initRelativeScaler(context);

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
              height: sy(80),
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
                          fontSize: sy(18),
                          color: '020202'.toColor(),
                        ),
                      ),
                      Text(
                        'Let’s get some foods',
                        style: textFontWeight300.copyWith(
                          fontSize: sy(10),
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: sy(50),
                    height: sy(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //// List Of Food
            Container(
              height: sy(220),
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (context, state) {
                  if (state is FoodLoadInProgress) {
                    return LoadingIndicator();
                  }
                  if (state is FoodLoadSuccess) {
                    return ListView(
                      padding: EdgeInsets.only(
                        left: defaultMargin,
                      ),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.food.data.data
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(
                                        right: defaultMargin),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Get.to(
                                        //   FoodDetailPage(
                                        //     transaction: Transaction(
                                        //       food: e,
                                        //       user: (context
                                        //                   .bloc<UserCubit>()
                                        //                   .state
                                        //               as UserLoadSuccess)
                                        //           .user,
                                        //     ),
                                        //     onBackButtonPressed: () {
                                        //       Get.back();
                                        //     },
                                        //   ),
                                        // );
                                      },
                                      child: FoodCard(
                                        food: e,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    );
                  }
                  if (state is FoodLoadError) {
                    return Text(state.message);
                  }
                  return ListView(
                    children: [],
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
                        print(index);
                      });
                    },
                  ),
                  SizedBox(
                    height: sy(12),
                  ),
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, state) {
                      if (state is FoodLoadInProgress) {
                        return LoadingIndicator();
                      }
                      if (state is FoodLoadError) {
                        return Text(state.message);
                      }
                      if (state is FoodLoadSuccess) {
                        return Builder(
                          builder: (_) {
                            List<DatumFood> foods = state.food.data.data
                                .where(
                                  (element) => element.types.contains(
                                    (selectedIndex == 0)
                                        ? 'new_food'
                                        : (selectedIndex == 1)
                                            ? 'popular'
                                            : 'recommended',
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
                                          rate: e.rate.toDouble(),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sy(65),
            ),
          ],
        )
      ],
    );
  }
}
