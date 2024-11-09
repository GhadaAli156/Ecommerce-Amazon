import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class MenueScreen extends StatelessWidget {
  const MenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.02),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: appBarGradientColor,begin: Alignment.centerLeft,end: Alignment.centerRight)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7
                ),
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemCount: 18,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(image: AssetImage('assets/images/menu_pics/$index.png'))
                    ),
                  );
                },
            ),
            CommanFunction.blankSpace(height*0.02, 0),
            ListView.builder(
              itemCount: 2,
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: height*0.005),
                    padding: EdgeInsets.symmetric(vertical: height*0.005,horizontal: width*0.03),
                    height: height*0.06,
                    width: width,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: teal)
                    ),
                    child: Row(
                      children: [
                        Text(index==0?'Settings':'Customer Service',style: textTheme.titleMedium,),
                        const Spacer(),
                        const Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                  );
                },
            )
          ],
        ),
      ),
    );
  }
}
