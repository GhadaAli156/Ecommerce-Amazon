import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: Row(
                children: [
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Hello, ',style: textTheme.bodyLarge),
                        TextSpan(text: 'Ghada',style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold))
                      ]
                  )),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: greyShade3,
                    radius: height*0.025,
                    child: const Icon(Icons.person),
                  )
                ],
              ),
            ),
            CommanFunction.blankSpace(height*0.01, 0),
            YourGridBtons(width: width, textTheme: textTheme),
            CommanFunction.blankSpace(height*0.02, 0),
            UsersOrders(width: width, height: height, textTheme: textTheme),
            CommanFunction.blankSpace(height*0.01, 0),
            CommanFunction.divider(),
            KeepShopping(width: width, height: height, textTheme: textTheme),
            CommanFunction.blankSpace(height*0.01, 0),
            CommanFunction.divider(),
            BuyAgain(width: width, height: height, textTheme: textTheme)
          ],
        ),
      ),
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
      child: Column(
        children: [
          Row(
            children: [
              Text('Keep shopping for',style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
              const Spacer(),
              Text('Browsing history',style: textTheme.bodyLarge!.copyWith(color: blue))
            ],
          ),
          CommanFunction.blankSpace(height*0.02, 0),
          GridView.builder(
            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9
              ),
              itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: greyShade3
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset('assets/images/menu_pics/${carouselPicture[index]}'),
                    ),
                  ),
                  Text('Product',style: textTheme.bodyMedium,)
                ],
              );
              },
          ),
        ],
      ),
    );
  }
}

class BuyAgain extends StatelessWidget {
  const BuyAgain({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
      child: Column(
        children: [
          Row(
            children: [
              Text('Buy Again',style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
              const Spacer(),
              Text('See All',style: textTheme.bodyLarge!.copyWith(color: blue))
            ],
          ),
          CommanFunction.blankSpace( height*0.02, 0),
          SizedBox(
              height: height*0.14,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width*0.02
                    ),
                    width: height*0.14,
                    height: height*0.14,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: greyShade3,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset('assets/images/categories/${byAgain[index]}'),
                  );
                },)
          )
        ],
      ),
    );
  }
}

class UsersOrders extends StatelessWidget {
  const UsersOrders({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
      child: Column(
        children: [
          Row(
            children: [
              Text('Your Orders',style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
              const Spacer(),
              Text('See All',style: textTheme.bodyLarge!.copyWith(color: blue))
            ],
          ),
          CommanFunction.blankSpace( height*0.02, 0),
          SizedBox(
            height: height*0.17,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: width*0.02
                    ),
                    width: width*0.4,
                    height: height*0.17,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: greyShade3,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset('assets/images/categories/${yourOrders[index]}',fit: BoxFit.cover,),
                  );
              },)
          )
        ],
      ),
    );
  }
}

class YourGridBtons extends StatelessWidget {
  const YourGridBtons({
    super.key,
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.2,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: grey
            ),
            borderRadius: BorderRadius.circular(50),
              color: greyShade2,
          ),
          child: Builder(builder: (context) {
            if(index==0){
              return  Text('Your Orders',style: textTheme.bodyMedium,);
            }
            if(index==1){
              return  Text('Buy Again',style: textTheme.bodyMedium,);
            }
            if(index==2){
              return  Text('Your Account',style: textTheme.bodyMedium,);
            }
            return Text('Your Wish List',style: textTheme.bodyMedium,);
          },),
        );
        },);
  }
}
