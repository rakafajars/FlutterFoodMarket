import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/illustration/illustration_page.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:supercharged/supercharged.dart';

class HistoryOrderPage extends StatefulWidget {
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  // posisi tab
  int selectedIndex = 0;

  List<Transaction> inProgress = mockTransaction
      .where(
        (element) =>
            element.status == TransactionStatus.on_delivery ||
            element.status == TransactionStatus.pending,
      )
      .toList();

  List<Transaction> past = mockTransaction
      .where(
        (element) =>
            element.status == TransactionStatus.delivered ||
            element.status == TransactionStatus.cancelled,
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && past.length == 0) {
      return IllustrationPage(
        title: 'Ouch! Hungry',
        subTitle: 'Seems like you have not\nordered any food yet',
        picturePath: 'assets/love_burger.png',
        buttonTap1: () {},
        buttonTitle1: 'Find Foods',
      );
    } else {
      return ListView(
        children: [
          Column(
            children: [
              // TODO Head Bar
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Orders',
                      style: textFontWeight500.copyWith(
                        fontSize: 22,
                        color: '020202'.toColor(),
                      ),
                    ),
                    Text(
                      'Wait for the best meal',
                      style: textFontWeight300.copyWith(
                        fontSize: 14,
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
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgress : past)
                          .map(
                            (e) => Text(
                              e.food.name,
                            ),
                          )
                          .toList(),
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
}
