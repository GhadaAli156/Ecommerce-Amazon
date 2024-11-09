import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/home/views/home_screen_banner.dart';
import 'package:amazon/view/user/home/views/home_sreen_categories_list.dart';
import 'package:amazon/view/user/menue/menue_screen.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'views/home_page_address_bar.dart';
import 'views/todays_deal_home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List<Widget> screens = [const HomeScreen(), const ProfileScreen(), const CartScreen(), const MenueScreen()];
  headPhoneDeals(int index) {
    switch (index) {
      case 0:
        return 'Boat';
      case 1:
        return 'Bose';
      case 2:
        return 'OnePlus';
      case 3:
        return 'Sony';
    }
  }
  clothingDeals(int index) {
        switch (index) {
          case 0:
            return 'Most-loved gifts';
          case 1:
            return 'Home';
          case 2:
            return 'Beauty';
          case 3:
            return 'Electronics';
        }
    }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          // HomePageAddressBar(height: height, width: width),
          // CommanFunction.divider(),
          HomeScreenCategoriesList(
              height: height, width: width, textTheme: textTheme),
          CommanFunction.blankSpace(height * 0.01, 0),
          CommanFunction.divider(),
          HomeScreenBanner(height: height),
          CommanFunction.divider(),
          TodaysDealHomeScreenWidget(
              width: width, height: height, textTheme: textTheme),
          CommanFunction.divider(),
          otherOfferGridWidget(
              title: 'Latest Launches in Headphones',
              productPicNamesList: headphoneDeals,
              textBtnName: 'Explore More',
              offerFor: 'headPhoneDeals'
          ),
          CommanFunction.divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: height*0.3,
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/books.jpg'),fit: BoxFit.cover)
              ),
            ),
          ),
          CommanFunction.divider(),
          otherOfferGridWidget(
              title: 'can\'t miss offers',
              productPicNamesList: clothingDeal,
              textBtnName: 'Explore More',
              offerFor: 'clothingDeals'
          ),

        ],
      ),
    );
  }

  Container otherOfferGridWidget(
      {required String title,
      required String textBtnName,
      required List<String> productPicNamesList,
        required String offerFor,
      }) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          CommanFunction.blankSpace(height * 0.01, 0),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/headphonedeals/${productPicNamesList[index]}'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Text(
                    offerFor=='headPhoneDeals'? headPhoneDeals(index) : clothingDeals(index),
                    style: textTheme.titleMedium,
                  )
                ],
              );
            },
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                textBtnName,
                style: textTheme.titleMedium!.copyWith(color: blue),
              ))
        ],
      ),
    );
  }
}


