import 'package:amazon/constants/constants.dart';
import 'package:flutter/material.dart';

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