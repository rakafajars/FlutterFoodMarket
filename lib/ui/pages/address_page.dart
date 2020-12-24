import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/widget/custome_button.dart';
import 'package:flutter_food_market/ui/widget/textfield_custome.dart';
import 'package:get/get.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  bool isLoading = false;
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
              isExpanded: true,
              underline: SizedBox(),
              items: [
                DropdownMenuItem(
                  child: Text(
                    'Bandung',
                    style: textFontWeight500.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  child: Text(
                    'Jakarta',
                    style: textFontWeight500.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  child: Text(
                    'Surabaya',
                    style: textFontWeight500.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              onChanged: (item) {},
            ),
          ),
          CustomeButton(
            child: CustomeRaisedButton(
              title: 'Sign Up Now',
              colorsButton: mainColor,
              colorsText: Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
