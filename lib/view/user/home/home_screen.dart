import 'dart:developer';

import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/cart/cart_screen.dart';
import 'package:amazon/view/user/menue/menue_screen.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:amazon/view/user/user_persistant_nav_bar/user_bottom_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List<Widget> screens = [HomeScreen(), ProfileScreen(), CartScreen(),MenueScreen()];
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
          HomePageAddressBar(height: height, width: width),
          CommanFunction.divider(),
          HomeScreenCategoriesList(
              height: height, width: width, textTheme: textTheme),
          CommanFunction.blankSpace(height * 0.01, 0),
          CommanFunction.divider(),
          HomeScreenBanner(height: height),
          CommanFunction.divider(),
          TodaysDealHomeScreenWidget(
              width: width, height: height, textTheme: textTheme),
          CommanFunction.divider(),
          OtherOfferGridWidget(
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
          OtherOfferGridWidget(
              title: 'can\'t miss offers',
              productPicNamesList: clothingDeal,
              textBtnName: 'Explore More',
              offerFor: 'clothingDeals'
          ),

        ],
      ),
    );
  }

  Container OtherOfferGridWidget(
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

class TodaysDealHomeScreenWidget extends StatelessWidget {
  const TodaysDealHomeScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '50% - 80% off | Latest deals.',
              style: textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: height * 0.23, viewportFraction: 1, autoPlay: true),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: white,
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/todays_deals/${i}',
                                ),
                                fit: BoxFit.fitHeight)));
                  },
                );
              }).toList(),
            ),
            CommanFunction.blankSpace(height * 0.01, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: red),
                  child: Text(
                    'Upto 62% off',
                    style: textTheme.titleMedium!.copyWith(color: white),
                  ),
                ),
                CommanFunction.blankSpace(0, width * 0.03),
                Text(
                  'Deal of the Day',
                  style: textTheme.titleMedium!
                      .copyWith(color: red, fontWeight: FontWeight.bold),
                )
              ],
            ),
            CommanFunction.blankSpace(height * 0.01, 0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/todays_deals/${todaysDeals[index]}'),
                          fit: BoxFit.cover)),
                );
              },
            ),
            CommanFunction.blankSpace(height * 0.01, 0),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See all Deals',
                  style: textTheme.titleMedium!.copyWith(color: blue),
                ))
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.23, viewportFraction: 1, autoPlay: true),
      items: carouselPicture.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/carousel_slideshow/${i}',
                        ),
                        fit: BoxFit.cover)));
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(
                      'assets/images/categories/${categories[index]}.png'),
                  height: height * 0.07,
                ),
                Text(
                  categories[index],
                  style: textTheme.labelMedium,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePageAddressBar extends StatelessWidget {
  const HomePageAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: addressBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: width * 0.02,
          right: width * 0.02,
          top: height * 0.05,
          bottom: height * 0.012),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.81,
            child: TextField(
              onTap: () {
                log('Redirecting you to search product');
              },
              cursorColor: black,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                hintText: 'Search Amazon.in',
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                    )),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.camera_viewfinder,
                      color: grey,
                    )),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.mic))
        ],
      ),
    );
  }
}
