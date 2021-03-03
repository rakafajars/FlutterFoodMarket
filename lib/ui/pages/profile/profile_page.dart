import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/logout/logout_cubit.dart';
import 'package:flutter_food_market/cubit/profile/profile_cubit.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/pages/auth/sign_in_page.dart';
import 'package:flutter_food_market/ui/pages/profile/profile_update.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:flutter_food_market/ui/widget/loading_indicator.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with RelativeScale {
  int selectedIndex = 0;

  ProfileCubit _profileCubit;

  @override
  void initState() {
    _profileCubit = BlocProvider.of<ProfileCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initRelativeScaler(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoadedSuccess) {
              Get.snackbar(
                '',
                '',
                backgroundColor: mainColor,
                icon: Icon(
                  MdiIcons.closeCircleOutline,
                  color: Colors.white,
                ),
                titleText: Text(
                  'Logout Success',
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
              Future.delayed(
                Duration(seconds: 1),
                () {
                  Get.offAll(
                    InitialSignInPage(),
                  );
                },
              );
            }
            if (state is LogoutLoadedFailed) {
              Get.snackbar(
                '',
                '',
                backgroundColor: pinkColor,
                icon: Icon(
                  MdiIcons.closeCircleOutline,
                  color: Colors.white,
                ),
                titleText: Text(
                  'Logout Failed',
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
        ),
        // BlocListener<SubjectBloc, SubjectState>(
        //   listener: (context, state) {
        //     // TODO: implement listener
        //   },
        // ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadInProgress) {
            return LoadingIndicator();
          }
          if (state is ProfileLoadedSuccess) {
            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  width: double.infinity,
                  height: sy(200),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: sy(90),
                        width: sy(90),
                        margin: EdgeInsets.only(
                          bottom: 16,
                        ),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/photo_border.png',
                            ),
                          ),
                        ),
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //       image: NetworkImage(
                        //         // (context.bloc<UserCubit>().state as UserLoadSuccess)
                        //         //     .user
                        //         //     .picturePath,
                        //         '',
                        //       ),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                      ),
                      Text(
                        state.user.data.name,
                        style: textFontWeight500.copyWith(
                          fontSize: sy(16),
                          color: '020202'.toColor(),
                        ),
                      ),
                      Text(
                        state.user.data.email,
                        style: textFontWeight300.copyWith(
                          fontSize: sy(12),
                          color: greyColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomTabBar(
                        title: ['Account', 'FoodMart'],
                        selectedIndex: selectedIndex,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                      SizedBox(
                        height: sy(14),
                      ),
                      Column(
                        children: ((selectedIndex == 0)
                                ? [
                                    'Edit Profile',
                                    'Home Address',
                                    'Security',
                                  ]
                                : [
                                    'Rate App',
                                    'Help Center',
                                    'Privacy & Policy',
                                    'Term & Condition'
                                  ])
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  if (e == "Edit Profile") {
                                    Get.to(
                                      InitialProfileUpdate(
                                        dataUser: state.user.data,
                                      ),
                                    ).then((value) {
                                      // _profileCubit..getUSer();
                                      if (value != null) {
                                        print(value);
                                        _profileCubit..getUSer();
                                      } else {
                                        print('Tidak Reload Data');
                                      }
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 16,
                                    left: defaultMargin,
                                    right: defaultMargin,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e,
                                        style: textFontWeight400.copyWith(
                                          fontSize: sy(12),
                                          color: '020202'.toColor(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: sy(20),
                                        width: sy(20),
                                        child: Image.asset(
                                          'assets/right_arrow.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.bloc<LogoutCubit>().logoutUser();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 16,
                            left: defaultMargin,
                            right: defaultMargin,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<LogoutCubit, LogoutState>(
                                builder: (context, state) {
                                  return state is LogoutLoadInProgress
                                      ? SpinKitThreeBounce(
                                          size: sy(20),
                                          color: mainColor,
                                        )
                                      : Text(
                                          'Logout',
                                          style: textFontWeight400.copyWith(
                                            fontSize: sy(12),
                                            color: '020202'.toColor(),
                                          ),
                                        );
                                },
                              ),
                              SizedBox(
                                height: sy(20),
                                width: sy(20),
                                child: Image.asset(
                                  'assets/right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          if (state is ProfileLoadedFailed) {
            return Text(state.message);
          }
          return Container(
            height: 150,
            width: 150,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
