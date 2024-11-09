import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          )),
      child: Row(
        children: [
          SvgPicture.asset('assets/master_card.svg'),
          const SizedBox(width: 23,),
          Text.rich(TextSpan(
              children: [
                const TextSpan(
                    text: 'Credit Card',
                    style: TextStyle(
                        backgroundColor: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        height: 0
                    )
                ),
                TextSpan(
                    text: 'Mastercard **78 ',
                    style: TextStyle(
                        backgroundColor: Colors.black.withOpacity(0.699999998079871),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        height: 0
                    )
                )
              ]
          ))
        ],
      ),
    );
  }
}
