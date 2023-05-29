import 'package:digital_currency/Ui/Ui_helper/BottomNav.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'MarketViewPage.dart';
import 'ProfilePage.dart';
import 'WatchListPage.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(Controller: pageController),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          MarketViewPage(),
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
