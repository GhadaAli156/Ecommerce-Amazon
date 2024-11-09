import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/styles.dart';
import 'card_info_widget.dart';
import 'payment_item_info.dart';
import 'total_price.dart';
class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          color: const Color(0xFFEDEDED)),
      child: Padding(
        padding: const EdgeInsets.only(top: 50+16,left: 22,right: 22),
        child: Column(
          children: [
            Text('Thank you',
            style: Styles.textStyle25),
            Text('Your transaction was successful',
            style: Styles.textStyle20,),
            const SizedBox(height: 42,),
            const PaymentItemInfo(title: 'Date',value: '01/24/2023',),
            const SizedBox(height: 20,),
            const PaymentItemInfo(title: 'Time',value: '10:15 AM',),
            const SizedBox(height: 20,),
            const PaymentItemInfo(title: 'To',value: 'Sam Louis',),
            const SizedBox(height: 20,),
            const Divider(height: 60,thickness: 2,),
            const TotalPrice(totalPrice: 'Total', price: '\$50.97'),
            const SizedBox(height: 30,),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode,size: 64,),
                Container(
                  width: 113,
                    height: 58,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          color: Color(0xff34A853)
                        ),
                        borderRadius: BorderRadius.circular(15)
                      )),
                  child: Center(child: Text('PAID',style: Styles.textStyle24.copyWith(color: Color(0xff34A853)),)),
                )
              ],
            ),
            SizedBox(height: ((MediaQuery.of(context).size.height*0.2+20)/2)-29,)
          ],
        ),
      ),
    );
  }
}
