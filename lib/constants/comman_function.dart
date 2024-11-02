import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
class CommanFunction{

  static blankSpace(double? height,double? width){
    return SizedBox(height: height,width: width,);
  }

  static divider(){
    return Divider(
      thickness: 3,
      color: greyShade3,
      height: 0,
    );
  }
}