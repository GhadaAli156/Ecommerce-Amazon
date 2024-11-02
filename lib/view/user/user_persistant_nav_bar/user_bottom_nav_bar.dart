import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/menue/menue_screen.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {

  PersistentTabController persistentTabController = PersistentTabController(
      initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ProfileScreen(),
      const CartScreen(),
      const MenueScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("you"),
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_shopping_cart),
        title: ("Cart"),
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu),
        title: ("Menu"),
        activeColorPrimary: teal,
        inactiveColorPrimary: black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.grey.shade900,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
    );
  }
}

