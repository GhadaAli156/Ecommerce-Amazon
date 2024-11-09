import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/home/views/home_page_app_bar.dart';
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
  List<Widget> screens = [const HomeScreen(), const ProfileScreen(), const CartScreen(),const MenueScreen()];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<PreferredSize> appBars = [
      PreferredSize(
          preferredSize: Size(width * 1, height * 0.88),
          child: HomePageAppBar(width: width, height: height)),
      PreferredSize(
          preferredSize: Size(width, height*0.08),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.01),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:  appBarGradientColor,begin: Alignment.centerLeft,end: Alignment.centerRight)
            ),
            child: Row(
              children: [
                Image.asset('assets/images/amazon_black_logo.png',height: height*0.05),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: black,size: height*0.035,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.search,color: black,size: height*0.035,))
              ],
            ),
          )
      ),
      PreferredSize(
          preferredSize: Size(width * 1, height * 0.88),
          child: HomePageAppBar(width: width, height: height)),
      PreferredSize(
          preferredSize: Size(width * 1, height * 0.88),
          child: HomePageAppBar(width: width, height: height))
    ];


    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: appBars[currentIndex],
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: white,
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
      ),
    );
  }
}
