import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/transaction.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  const PaymentPage({Key key, this.transaction}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      paddingListView: EdgeInsets.only(
        bottom: 8,
      ),
      title: 'Payment',
      subTitle: 'You deserve better meal',
      onBackButtonPressed: () {},
      backColorButton: 'FAFAFC'.toColor(),
      child: Stack(
        children: [
          Column(
            children: [
              // TODO bagian atas

              Container(
                margin: EdgeInsets.only(
                  bottom: defaultMargin,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 16,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Item Ordered',
                      style: textFontWeight400.copyWith(
                        fontSize: 14,
                        color: '020202'.toColor(),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                                      widget.transaction.food.picturePath,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 189,

                                  // 2 * default margin (jarak border)

                                  // 60 lebar gambar +

                                  // 12 jarak gambar +

                                  // 78 +

                                  child: Text(
                                    widget.transaction.food.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: textFontWeight400.copyWith(
                                      fontSize: 14,
                                      color: '020202'.toColor(),
                                    ),
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id-ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                  ).format(
                                    widget.transaction.food.price,
                                  ),
                                  style: textFontWeight400.copyWith(
                                    fontSize: 13,
                                    color: greyColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${widget.transaction.quantity} item(s)',
                          style: textFontWeight400.copyWith(
                            fontSize: 13,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 8,
                      ),
                      child: Text(
                        'Detail Transaction',
                        style: textFontWeight400.copyWith(
                          fontSize: 14,
                          color: '020202'.toColor(),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.food.name,
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              widget.transaction.total,
                            ),
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Driver',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              50000,
                            ),
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'TAX 10%',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              widget.transaction.quantity *
                                  widget.transaction.food.price *
                                  0.1,
                            ),
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Total Price',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              widget.transaction.food.price *
                                      widget.transaction.quantity *
                                      1.1 +
                                  50000,
                            ),
                            style: textFontWeight500.copyWith(
                              fontSize: 14,
                              color: '1ABC9C'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  bottom: defaultMargin,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 16,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 8,
                      ),
                      child: Text(
                        'Deliver to:',
                        style: textFontWeight400.copyWith(
                          fontSize: 14,
                          color: '020202'.toColor(),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Name',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user.name,
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Phone No.',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user.phoneNumber,
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'Address',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user.address,
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'House No.',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user.houseNumber,
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            'City',
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: greyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user.city,
                            style: textFontWeight400.copyWith(
                              fontSize: 14,
                              color: '020202'.toColor(),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomeButton(
                child: CustomeRaisedButton(
                  colorsText: Colors.black,
                  title: 'Checkout Now',
                  colorsButton: mainColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}