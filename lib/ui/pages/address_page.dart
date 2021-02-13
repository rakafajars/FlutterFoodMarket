import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/cubit/transaction/transaction_cubit.dart';
import 'package:flutter_food_market/cubit/user/user_cubit.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/pages/main_page.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:flutter_food_market/ui/widget/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();
    cities = ['Bandung', 'Jakarta', 'Bali'];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButtonPressed: () {
        Get.back();
      },
      title: 'Address',
      subTitle: "Make sure it's valid",
      child: Column(
        children: [
          CustomeTextFieldTitle(
            title: 'Phone No.',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              26,
              defaultMargin,
              6,
            ),
          ),
          CustomeTextField(
            controller: phoneNumberController,
            hintFieldStyle: TextStyle(
              color: greyColor,
            ),
            hintFieldText: 'Type your phone number',
          ),
          CustomeTextFieldTitle(
            title: 'Address',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              16,
              defaultMargin,
              6,
            ),
          ),
          CustomeTextField(
            controller: addressController,
            hintFieldStyle: TextStyle(
              color: greyColor,
            ),
            hintFieldText: 'Type your address',
          ),
          CustomeTextFieldTitle(
            title: 'House No.',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              16,
              defaultMargin,
              6,
            ),
          ),
          CustomeTextField(
            controller: houseNumberController,
            hintFieldStyle: TextStyle(
              color: greyColor,
            ),
            hintFieldText: 'Type your house number',
          ),
          CustomeTextFieldTitle(
            title: 'City',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              16,
              defaultMargin,
              6,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: DropdownButton(
              value: selectedCity,
              isExpanded: true,
              underline: SizedBox(),
              items: cities
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: textFontWeight500.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(
                  () {
                    selectedCity = item;
                  },
                );
              },
            ),
          ),
          CustomeButton(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: (isLoading == true)
                ? LoadingIndicator()
                : CustomeRaisedButton(
                    title: 'Sign Up Now',
                    colorsButton: mainColor,
                    colorsText: Colors.black,
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: phoneNumberController.text,
                          address: addressController.text,
                          houseNumber: houseNumberController.text,
                          city: selectedCity);

                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signUp(
                            user,
                            widget.password,
                            pictureFile: widget.pictureFile,
                          );

                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoadSuccess) {
                        context.bloc<FoodCubit>().getFoods();
                        context.bloc<TransactionCubit>().getTransaction();
                        Get.to(
                          MainPage(),
                        );
                      } else {
                        Get.snackbar(
                          '',
                          '',
                          backgroundColor: pinkColor,
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            'Sign In Failed',
                            style: textFontWeight600.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          messageText: Text(
                            (state as UserLoadError).message,
                            style: textFontWeightNormal.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
