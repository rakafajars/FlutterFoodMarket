import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/address_page.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:flutter_food_market/ui/widget/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with RelativeScale {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return GeneralPage(
      paddingListView: EdgeInsets.only(
        bottom: 6,
      ),
      onBackButtonPressed: () {
        Get.back();
      },
      title: 'Sign Up',
      subTitle: 'Register and eat',
      child: Column(
        children: [
          Container(
            width: sy(100),
            height: sy(100),
            margin: EdgeInsets.only(
              top: 26,
            ),
            padding: EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/photo_border.png',
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.idntimes.com/content-images/community/2020/11/14-b1fe04b0ceee0bcd7cd47663ff17b2e9.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          CustomeTextFieldTitle(
            title: 'Full Name',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              26,
              defaultMargin,
              6,
            ),
          ),
          CustomeTextField(
            controller: fullNameController,
            hintFieldStyle: TextStyle(
              color: greyColor,
            ),
            hintFieldText: 'Type your full name',
          ),
          CustomeTextFieldTitle(
            title: 'Email Address',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              16,
              defaultMargin,
              6,
            ),
          ),
          CustomeTextField(
            controller: emailController,
            hintFieldStyle: TextStyle(
              color: greyColor,
            ),
            hintFieldText: 'Type your email address',
          ),
          CustomeTextFieldTitle(
            title: 'Password',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              16,
              defaultMargin,
              6,
            ),
          ),
          CustomeTextField(
            controller: passwordController,
            hintFieldStyle: TextStyle(
              color: greyColor,
            ),
            hintFieldText: 'Type your password',
          ),
          CustomeButton(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: CustomeRaisedButton(
              title: 'Continue',
              colorsButton: mainColor,
              colorsText: Colors.black,
              onPressed: () {
                Get.to(
                  AddressPage(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
