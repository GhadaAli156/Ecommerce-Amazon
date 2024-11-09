import 'package:amazon/features/checkout/presentation/widget/thank_you_card.dart';
import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';
class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          const ThankYouCard(),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height*.2+20,
            left: 20+8,
            right: 20+8,
            child: Expanded(
              child: CustomDashedLine(),
            ),
          ),
          Positioned(
    bottom: MediaQuery.of(context).size.height*.2,
              left: -20,
              child: CircleAvatar(
            backgroundColor: Colors.white,
          )),
          Positioned(
              bottom: MediaQuery.of(context).size.height*.2,
              right: -20,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              )),
        ],
      ),
    );
  }
}
