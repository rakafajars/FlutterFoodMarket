import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_market/cubit/update_profile/update_profile_cubit.dart';
import 'package:flutter_food_market/model/post_register.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/general_page.dart';
import 'package:flutter_food_market/ui/widget/custom_button.dart';
import 'package:flutter_food_market/ui/widget/custom_textfield.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InitialProfileUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateProfileCubit>(
      create: (context) => UpdateProfileCubit(),
      child: ProfileUpdate(),
    );
  }
}

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> with RelativeScale {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  List _listCity = ["Bandung", "Jakarta", "Surabaya"];

  String initialCity = "Bandung";

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    houseNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return GeneralPage(
      title: 'Edit Profile',
      subTitle: 'Change your profile the best',
      paddingListView: EdgeInsets.only(
        bottom: 6,
      ),
      onBackButtonPressed: () {
        Get.back();
      },
      child: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileLoadedSuccess) {
            Get.snackbar(
              '',
              '',
              backgroundColor: mainColor,
              icon: Icon(
                MdiIcons.closeCircleOutline,
                color: Colors.white,
              ),
              titleText: Text(
                'Update Profile Success',
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
          if (state is UpdateProfileLoadedFailed) {
            Get.snackbar(
              '',
              '',
              backgroundColor: pinkColor,
              icon: Icon(
                MdiIcons.closeCircleOutline,
                color: Colors.white,
              ),
              titleText: Text(
                'Update Profile Failed',
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
        },
        child: Form(
          key: _formKey,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama Tidak Boleh Kosong';
                  }
                  return null;
                },
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
                title: 'Phone No.',
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
                    return 'Phone Tidak Boleh Kosong';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Address Tidak Boleh Kosong';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nomor Rumah Tidak Boleh Kosong';
                  }
                  return null;
                },
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
                  value: initialCity,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: _listCity.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: textFontWeight500.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (item) {
                    setState(() {
                      initialCity = item;
                      print(initialCity);
                    });
                  },
                ),
              ),
              CustomeButton(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                ),
                child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                  builder: (context, state) {
                    return state is UpdateProfileLoadInProgress
                        ? LoadingIndicator()
                        : CustomeRaisedButton(
                            title: 'Change Profile',
                            colorsButton: mainColor,
                            colorsText: Colors.black,
                            onPressed: () {
                              var updateUser = PostRegister(
                                name: fullNameController.text,
                                email: emailController.text,
                                address: addressController.text,
                                city: initialCity,
                                houseNumber: houseNumberController.text,
                                phoneNumber: phoneNumberController.text,
                              );

                              if (_formKey.currentState.validate()) {
                                context.bloc<UpdateProfileCubit>().updateUser(
                                      updateUser,
                                    );
                              }
                            },
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
