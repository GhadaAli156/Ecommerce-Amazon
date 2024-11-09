import 'package:flutter/material.dart';

import '../utils/styles.dart';
class CustomButton extends StatelessWidget {
  void Function()? onTap;
  final String textButton;
  final bool isLoading;
   CustomButton({super.key,this.onTap, required this.textButton, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xff34A853),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )),
        child: Center(
          child: isLoading? CircularProgressIndicator() : Text(textButton,
          textAlign: TextAlign.center,
            style: Styles.textStyle22,
          ),
        ),
      ),
    );
  }
}
