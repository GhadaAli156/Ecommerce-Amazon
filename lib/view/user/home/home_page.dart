import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/menue/menue_screen.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex=0;
  List<Widget> screens = [HomeScreen(), ProfileScreen(), CartScreen(),MenueScreen()];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.88),
          child: HomePageAppBar(width: width, height: height)),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,

          selectedItemColor: teal,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'you',),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label: 'Cart')    ,
            BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Menu')
          ]),
    );
  }
}
