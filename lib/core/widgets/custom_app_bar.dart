import 'package:flutter/material.dart';
import '../utils/styles.dart';
AppBar buildAppBar({final String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: const Icon(Icons.arrow_back,color: Colors.black,),
    centerTitle: true,
    title: Text(title??'',
      textAlign: TextAlign.center,
      style: Styles.textStyle25,),
  );
}