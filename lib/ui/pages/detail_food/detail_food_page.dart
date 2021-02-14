import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/payment/payment_page.dart';
import 'package:flutter_food_market/ui/widget/rating_stars.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  const FoodDetailPage({
    Key key,
    this.onBackButtonPressed,
    this.transaction,
  }) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> with RelativeScale {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              height: sy(280),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.transaction.food.picturePath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    /// Back Button,
                    Container(
                      height: sy(80),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackButtonPressed != null) {
                              widget.onBackButtonPressed();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            width: sy(28),
                            height: sy(28),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12,
                            ),
                            child: Image.asset('assets/back_arrow_white.png'),
                          ),
                        ),
                      ),
                    ),

                    /// Body
                    Container(
                      margin: EdgeInsets.only(
                        top: 180,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 26),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        sy(140),
                                    child: Text(
                                      widget.transaction.food.name,
                                      style: textFontWeight400.copyWith(
                                        color: '020202'.toColor(),
                                        fontSize: sy(14),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: sy(4),
                                  ),
                                  RatinStars(
                                    rate: widget.transaction.food.rate,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: sy(24),
                                      height: sy(24),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 1,
                                        ),
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/btn_min.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: sy(40),
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: textFontWeight400.copyWith(
                                        color: '020202'.toColor(),
                                        fontSize: sy(14),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: sy(24),
                                      height: sy(24),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 1,
                                        ),
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/btn_add.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(
                              widget.transaction.food.description,
                              style: textFontWeight400.copyWith(
                                color: greyColor,
                                fontSize: sy(12),
                              ),
                            ),
                          ),
                          Text(
                            'Ingredients:',
                            style: textFontWeight400.copyWith(
                              color: '020202'.toColor(),
                              fontSize: sy(12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                            child: Text(
                              widget.transaction.food.ingredients,
                              style: textFontWeight400.copyWith(
                                color: greyColor,
                                fontSize: sy(12),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: textFontWeight400.copyWith(
                                      color: greyColor,
                                      fontSize: sy(12),
                                    ),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                    ).format(
                                      quantity * widget.transaction.food.price,
                                    ),
                                    style: textFontWeight400.copyWith(
                                      color: '020202'.toColor(),
                                      fontSize: sy(12),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: sy(140),
                                height: sy(40),
                                child: RaisedButton(
                                  onPressed: () {
                                    Get.to(
                                      PaymentPage(
                                        transaction:
                                            widget.transaction.copyWith(
                                          quantity: quantity,
                                          total: quantity *
                                              widget.transaction.food.price,
                                        ),
                                      ),
                                    );
                                  },
                                  color: mainColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Order Now',
                                    style: textFontWeight500.copyWith(
                                      color: '020202'.toColor(),
                                      fontSize: sy(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
