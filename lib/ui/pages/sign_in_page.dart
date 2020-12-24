import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/pages/sign_up_page.dart';
import 'package:flutter_food_market/ui/widget/custome_button.dart';
import 'package:flutter_food_market/ui/widget/textfield_custome.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subTitle: 'Find your best ever meal',
      child: Column(
        children: [
          CustomeTextFieldTitle(
            title: 'Email Address',
            margin: EdgeInsets.fromLTRB(
              defaultMargin,
              26,
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
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : CustomeRaisedButton(
                    title: 'Sign In',
                    colorsButton: mainColor,
                    colorsText: Colors.white,
                    onPressed: () {},
                  ),
          ),
          CustomeButton(
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : CustomeRaisedButton(
                    title: 'Create New Account',
                    colorsButton: greyColor,
                    colorsText: Colors.white,
                    onPressed: () {
                      Get.to(
                        SignUpPage(),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
