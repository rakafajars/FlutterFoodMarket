import 'package:flutter/material.dart';
import 'package:flutter_food_market/cubit/food/food_cubit.dart';
import 'package:flutter_food_market/cubit/logout/logout_cubit.dart';
import 'package:flutter_food_market/cubit/transaction/transaction_cubit.dart';
import 'package:flutter_food_market/ui/pages/auth/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogoutCubit>(create: (context) => LogoutCubit()),
        BlocProvider<FoodCubit>(create: (context) => FoodCubit()),
        BlocProvider<TransactionCubit>(create: (context) => TransactionCubit())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitialSignInPage(),
      ),
    );
  }
}
