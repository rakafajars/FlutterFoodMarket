import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/cubit/transaction/transaction_cubit.dart';
import 'package:flutter_food_market/cubit/user/user_cubit.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/auth/sign_up_page.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/pages/main_page.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:flutter_food_market/ui/widget/custom_textfield.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
            obscureText: true,
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
            child: isLoading
                ? LoadingIndicator()
                : CustomeRaisedButton(
                    title: 'Sign In',
                    colorsButton: mainColor,
                    colorsText: Colors.black,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await context.bloc<UserCubit>().signIn(
                            emailController.text,
                            passwordController.text,
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
          CustomeButton(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
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
