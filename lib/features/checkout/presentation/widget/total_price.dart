import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
class TotalPrice extends StatelessWidget {
  final String totalPrice, price;
  const TotalPrice({super.key, required this.totalPrice, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(totalPrice,style: Styles.textStyle24,textAlign: TextAlign.center,),
        const Spacer(),
        Text(price,style: Styles.textStyle24,textAlign: TextAlign.center,)
      ],
    );
  }
}
