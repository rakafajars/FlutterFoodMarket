import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/cubit/login/login_cubit.dart';
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
import 'package:email_validator/email_validator.dart';

class InitialSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadedFailed) {
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
                state.message,
                style: textFontWeightNormal.copyWith(
                  color: Colors.white,
                ),
              ),
            );
          }
          if (state is LoginLoadedSuccess) {
            Get.snackbar(
              '',
              '',
              backgroundColor: mainColor,
              icon: Icon(
                MdiIcons.closeCircleOutline,
                color: Colors.white,
              ),
              titleText: Text(
                'Sign In Success',
                style: textFontWeight600.copyWith(
                  color: Colors.white,
                ),
              ),
              messageText: Text(
                state.message,
                style: textFontWeightNormal.copyWith(
                  color: Colors.white,
                ),
              ),
            );
            // context.bloc<FoodCubit>().getFoods();
            // context.bloc<TransactionCubit>().getTransaction();
            // Get.to(
            //   MainPage(),
            // );
          }
        },
        child: Form(
          key: _formKey,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email Tidak Boleh Kosong';
                  }
                  if (EmailValidator.validate(value) == true) {
                    return null;
                  }
                  if (EmailValidator.validate(value) == false) {
                    return 'Gunakan @ untuk login';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password Tidak Boleh Kosong';
                  }
                  return null;
                },
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
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return state is LoginLoadInProgress
                        ? LoadingIndicator()
                        : CustomeRaisedButton(
                            title: 'Sign In',
                            colorsButton: mainColor,
                            colorsText: Colors.black,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                context.bloc<LoginCubit>().login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                              }
                            },
                          );
                  },
                ),
              ),
              CustomeButton(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                ),
                child: CustomeRaisedButton(
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
        ),
      ),
    );
  }
}
