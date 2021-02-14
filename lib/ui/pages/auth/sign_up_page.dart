import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/address_page.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:flutter_food_market/ui/widget/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: 110,
              height: 110,
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
              child: (pictureFile != null)
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(
                            pictureFile,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/photo.png',
                          ),
                          fit: BoxFit.cover,
                        ),
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
            obscureText: true,
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
                  AddressPage(
                    User(
                      name: fullNameController.text,
                      email: emailController.text,
                    ),
                    passwordController.text,
                    pictureFile,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
