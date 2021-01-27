import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/user/user_cubit.dart';
import 'package:flutter_food_market/model/user.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:flutter_food_market/ui/widget/custom_tab_bar.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          height: 220,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 110,
                width: 110,
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
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        (context.bloc<UserCubit>().state as UserLoadSuccess)
                            .user
                            .picturePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                (context.bloc<UserCubit>().state as UserLoadSuccess).user.name,
                style: textFontWeight500.copyWith(
                  fontSize: 18,
                  color: '020202'.toColor(),
                ),
              ),
              Text(
                (context.bloc<UserCubit>().state as UserLoadSuccess).user.email,
                style: textFontWeight300.copyWith(
                  fontSize: 14,
                  color: greyColor,
                ),
              )
            ],
          ),
        ),
        // // Body
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
                height: 16,
              ),
              Column(
                children: ((selectedIndex == 0)
                        ? [
                            'Edit Profile',
                            'Home Address',
                            'Security',
                            'Payment'
                          ]
                        : [
                            'Rate App',
                            'Help Center',
                            'Privacy & Policy',
                            'Term & Condition'
                          ])
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.only(
                          bottom: 16,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e,
                              style: textFontWeight400.copyWith(
                                fontSize: 14,
                                color: '020202'.toColor(),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                'assets/right_arrow.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        )
      ],
    );
  }
}
