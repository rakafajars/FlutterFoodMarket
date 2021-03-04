import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/transaction/transaction_cubit.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/illustration/illustration_page.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:flutter_food_market/ui/widget/food_list_item.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryOrderPage extends StatefulWidget {
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage>
    with RelativeScale {
  // posisi tab
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoadInProgress) {
          return LoadingIndicator();
        }
        if (state is TransactionLoadSuccess) {
          if (state.transaction.data == null) {
            return IllustrationPage(
              title: 'Ouch! Hungry',
              subTitle: 'Seems like you have not\nordered any food yet',
              picturePath: 'assets/love_burger.png',
              buttonTap1: () {},
              buttonTitle1: 'Find Foods',
            );
          } else {
            double listItemWidth =
                MediaQuery.of(context).size.width - 2 * defaultMargin;
            return ListView(
              children: [
                Column(
                  children: [
                    // TODO Head Bar
                    Container(
                      height: sy(80),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Orders',
                            style: textFontWeight500.copyWith(
                              fontSize: sy(18),
                              color: '020202'.toColor(),
                            ),
                          ),
                          Text(
                            'Wait for the best meal',
                            style: textFontWeight300.copyWith(
                              fontSize: sy(10),
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO BODY
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            title: [
                              'In Progress',
                              'Post Orders',
                            ],
                            selectedIndex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          SizedBox(
                            height: sy(12),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: defaultMargin,
                                  right: defaultMargin,
                                  bottom: 16,
                                ),
                                child: FoodListItem(
                                  pictureFood:
                                      state.transaction.data.food.picturePath,
                                  pictureNameFood:
                                      state.transaction.data.food.name,
                                  priceFood: state.transaction.data.food.price,
                                  itemWidth: listItemWidth,
                                  childCustom: SizedBox(
                                    width: sy(90),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateTime.now().toString(),
                                          style: textFontWeight400.copyWith(
                                            fontSize: sy(10),
                                            color: greyColor,
                                          ),
                                        ),
                                        (state.transaction.data.status ==
                                                'CANCELLED')
                                            ? Text(
                                                'Canceled',
                                                style:
                                                    textFontWeight400.copyWith(
                                                  fontSize: sy(10),
                                                  color: Colors.red,
                                                ),
                                              )
                                            : (state.transaction.data.status ==
                                                    'PENDING')
                                                ? Text(
                                                    'Pending',
                                                    style: textFontWeight400
                                                        .copyWith(
                                                      fontSize: sy(10),
                                                      color: mainColor,
                                                    ),
                                                  )
                                                : (state.transaction.data
                                                            .status ==
                                                        'ON_DELIVERY')
                                                    ? Text(
                                                        'On Delivery',
                                                        style: textFontWeight400
                                                            .copyWith(
                                                          fontSize: sy(10),
                                                          color: Colors.green,
                                                        ),
                                                      )
                                                    : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          }
        }
        if (state is TransactionLoadError) {
          return Text(state.message);
        }
        return Container();
      },
    );
  }
}

String convertDateTime(DateTime dateTime) {
  String month;
  switch (dateTime.month) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'Mei';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'OKt';
      break;
    case 11:
      month = 'Nov';
      break;
    default:
      month = 'Des';
  }

  return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
}
