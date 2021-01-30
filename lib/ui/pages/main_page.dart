import 'package:flutter/material.dart';
import 'package:flutter_food_market/ui/pages/history_order_page/history_order_page.dart';
import 'package:flutter_food_market/ui/pages/home/food_page.dart';
import 'package:flutter_food_market/ui/pages/profile/profile_page.dart';
import 'package:flutter_food_market/ui/widget/custom_bottom_navbar.dart';
import 'package:supercharged/supercharged.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({
    Key key,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: HistoryOrderPage(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtonNavBar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
