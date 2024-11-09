import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                                  'assets/images/todays_deals/$i',
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