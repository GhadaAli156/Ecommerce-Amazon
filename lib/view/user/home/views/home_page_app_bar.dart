import 'dart:developer';

import 'package:amazon/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: width * 0.02,
          right: width * 0.02,
          top: height * 0.01,
          bottom: height * 0.012),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.81,
            child: TextField(
              onTap: () {
                log('Redirecting you to search product');
              },
              cursorColor: black,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                hintText: 'Search Amazon.in',
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                    )),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.camera_viewfinder,
                      color: grey,
                    )),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey)),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
        ],
      ),
    );
  }
}