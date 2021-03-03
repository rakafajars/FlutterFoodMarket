import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/cubit/logout/logout_cubit.dart';
import 'package:flutter_food_market/cubit/profile/profile_cubit.dart';
import 'package:flutter_food_market/cubit/transaction/transaction_cubit.dart';
import 'package:flutter_food_market/ui/pages/auth/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit()..getUSer(),
        ),
        BlocProvider<LogoutCubit>(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider<FoodCubit>(
          create: (context) => FoodCubit(),
        ),
        BlocProvider<TransactionCubit>(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
