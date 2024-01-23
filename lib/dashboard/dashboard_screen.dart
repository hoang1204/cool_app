import 'package:brandshop/account/views/account_screen.dart';
import 'package:brandshop/cart/views/cart_screen.dart';
import 'package:brandshop/categories/views/categories_screen.dart';
import 'package:brandshop/home/views/home-screen.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../offers/views/offer_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationScreen(),
    CartScreen(),
    OffersScreen(),
    AccountScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: AppColor.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: 'Notification',
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: AppColor.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.shopping_bag,
          color: AppColor.mainColor,
          size: 35,
        ),
        title: 'Cart',
        activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
        inactiveColorPrimary: AppColor.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.card_travel_rounded),
        title: 'Offers',
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: AppColor.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: 'Account',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: AppColor.mainColor,
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.grey.shade100,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
