import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommanFunction {
  static blankSpace(double? height, double? width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static divider() {
    return Divider(
      thickness: 3,
      color: greyShade3,
      height: 0,
    );
  }

  static showToast({required BuildContext context, required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: white,
        textColor: black,
        fontSize: 16.0);
  }
}
