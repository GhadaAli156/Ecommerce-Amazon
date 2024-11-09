import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/features/checkout/presentation/views/my_cart_views.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.03,
        vertical: height*0.02
      ),
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Subtotal ',style: textTheme.titleLarge),
                      TextSpan(text: '53313 ',style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold))
                    ])),
            CommanFunction.blankSpace(height*0.01, 0),
            SizedBox(
              height: height*0.06,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle,color: teal,),
                  CommanFunction.blankSpace(0, width*0.01),
                  Expanded(
                    child: Column(
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: 'Your Order is eligible for FREE Delivery.',style: textTheme.bodyMedium !.copyWith(color: teal)),
                          TextSpan(text: 'Select this Option at checkout.',style: textTheme.bodyMedium ),
                    
                        ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            CommanFunction.blankSpace(height*0.01, 0),
            ElevatedButton(
                onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: amber,
                minimumSize: Size(width, height*0.06),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
                child: Text('Preceed to Buy',style: textTheme.bodyLarge,),
            ),
            CommanFunction.blankSpace(height*0.02, 0),
            CommanFunction.divider(),
            CommanFunction.blankSpace(height*0.02, 0),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: width,
                  padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.02),
                  margin: EdgeInsets.symmetric(vertical: height*0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyShade1
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/todays_deals/todaysDeal1.png',fit: BoxFit.fitWidth,),
                              CommanFunction.blankSpace(height*0.01, 0),
                              Container(
                                height: height*0.06,
                              width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: greyShade3)
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(right: BorderSide(color: greyShade3))
                                          ),
                                            child: Icon(Icons.remove,color: black,))),
                                    Expanded(flex: 3,child: Container(color: white,alignment: Alignment.center,child: Text('1'))),
                                    Expanded(flex: 2,child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(left: BorderSide(color: greyShade3))
                                        ),
                                        child: Icon(Icons.add,color: black,)))
                                  ],
                                ),
                              )
                            ],
                          )),
                      CommanFunction.blankSpace(0, width*0.02),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text('Product Name',style: textTheme.bodyLarge,),
                            CommanFunction.blankSpace(height*0.005, 0),
                            Text('\$5678',style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                            CommanFunction.blankSpace(height*0.005, 0),
                            Text('Eligible for Free Shipping',style: textTheme.bodySmall!.copyWith(color: grey),),
                            CommanFunction.blankSpace(height*0.005, 0),
                            Text('In Stock',style: textTheme.bodySmall!.copyWith(color: teal),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: red,side: BorderSide(color: greyShade3)), child: Text('Delete',style: textTheme.bodyMedium!.copyWith(color: black),)),
                              ElevatedButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCartViews(),));
                              }, style: ElevatedButton.styleFrom(backgroundColor: Colors.green,side: BorderSide(color: greyShade3)), child: Text('Buy',style: textTheme.bodyMedium!.copyWith(color: black),))
                            ],)
                          ],
                        ),
                      )
                    ],
                  ),
                );
            },)
          ],
        ),
      ),
    );
  }
}
