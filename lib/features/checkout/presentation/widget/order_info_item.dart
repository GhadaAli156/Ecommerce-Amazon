import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
class OrderInfoItem extends StatelessWidget {
  final String title , price;
  const OrderInfoItem({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Styles.textStyle18,textAlign: TextAlign.center,),
        const Spacer(),
        Text(price,style: Styles.textStyle18,textAlign: TextAlign.center,)
      ],
    );
  }
}
