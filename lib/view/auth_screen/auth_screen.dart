import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'otp_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin= true;
  String currentCountryCode = '+91';
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.grey,
          elevation: 3,
          backgroundColor: white,
          title: Image.asset(
            'assets/images/amazon_logo.png',
            height: height * 0.04,
          )),
      body: SafeArea(
          child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome',style: textThem.displaySmall!.copyWith(fontWeight: FontWeight.w400),),
                  CommanFunction.blankSpace(height*0.02, 0),
                  //SignIn(width, height, textThem, context),
                  //CreateAccount(width, height, textThem, context),
                  Builder(builder: (context) {
                    if(inLogin){
                      return SignIn(width, height, textThem, context);
                    }
                    else{
                      return CreateAccount(width, height, textThem, context);
                    }
                  },),
                  CommanFunction.blankSpace(height*0.05, 0),
                  BottomAuthScreenWidget(width: width, height: height, textThem: textThem)
                ],
              ),
            ),
      ),
      ),
    );
  }

  Container SignIn(double width, double height, TextTheme textThem, BuildContext context) {
    return Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: greyShade3
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      height: height*0.06,
                      width: width,
                      decoration: BoxDecoration(
                        color: greyShade1,
                        border: Border(
                          bottom: BorderSide(
                            color: greyShade3
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width*0.03
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            inLogin=false;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: height*0.03,
                              width: height*0.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.circle,
                                size: height*0.015,
                                color: inLogin ? transparent : secondaryColor,
                              ),
                            ),
                            CommanFunction.blankSpace(0, width*0.02),
                            RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Create Account.',
                                      style: textThem.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                                    ),
                                    TextSpan(
                                        text: ' New To Amazon? ',
                                        style: textThem.bodyMedium
                                    )
                                  ]
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width*0.03,
                        vertical: height*0.01
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {setState(() {
                              inLogin=true;
                            });
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: height*0.03,
                                  width: height*0.03,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: grey),
                                      color: white
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.circle,
                                    size: height*0.015,
                                    color: inLogin ? secondaryColor : transparent,
                                  ),
                                ),
                                CommanFunction.blankSpace(0, width*0.02),
                                RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: 'Sign in. ',
                                              style: textThem.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                                          ),
                                          TextSpan(
                                              text: 'Already a customer?',
                                              style: textThem.bodyMedium
                                          )
                                        ]
                                    )
                                )
                              ],
                            ),
                          ),
                          CommanFunction.blankSpace(height*0.01, 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                    showCountryPicker(
                                      context: context,
                                      onSelect: (value) {
                                        currentCountryCode = '+${value.phoneCode}';
                                      },);
                                },
                                child: Container(
                                  height: height*0.06,
                                  width: width*0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: grey
                                    ),
                                    color: greyShade2,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Text(currentCountryCode,style: textThem.headlineSmall!.copyWith(fontWeight: FontWeight.w500),),
                                ),
                              ),
                              SizedBox(
                                height: height*0.06,
                                width: width*0.62,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: mobileController,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(color: secondaryColor)
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: grey)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: grey)
                                    ),
                                  ),
                                  cursorColor: black,
                                ),
                              )
                            ],
                          ),
                          CommanFunction.blankSpace(height*0.02, 0),
                          CommonAuthButton(title: 'Continue', onPressed: () {
                              String mobileNumber = mobileController.text.trim();
                              if (mobileNumber.isNotEmpty) {
                                Provider.of<AutProvider>(context, listen: false).updatePhoneNum(num: mobileNumber);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OTPScreen(mobileNumber: mobileNumber),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Please enter your mobile number')),
                                );
                              }
                          },btnWidth: 0.88,),
                          CommanFunction.blankSpace(height*0.02, 0),
                          RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By Continuing you agree Amazon\'s ',
                                style: textThem.labelLarge
                              ),
                              TextSpan(
                                  text: 'Conditions of use ',
                                  style: textThem.labelLarge!.copyWith(color: blue)
                              ),
                              TextSpan(
                                  text: 'and ',
                                  style: textThem.labelLarge
                              ),
                              TextSpan(
                                  text: 'Privacy Notice',
                                  style: textThem.labelLarge!.copyWith(color: blue)
                              )
                            ]
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
  Container CreateAccount(double width, double height, TextTheme textThem, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
              color: greyShade3
          )
      ),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width*0.03,
                vertical: height*0.01
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                    inLogin=false;
                  });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: height*0.03,
                        width: height*0.03,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: grey),
                            color: white
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height*0.015,
                          color: inLogin ? transparent : secondaryColor,
                        ),
                      ),
                      CommanFunction.blankSpace(0, width*0.02),
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Create Account. ',
                                    style: textThem.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: 'New to Amazon?',
                                    style: textThem.bodyMedium
                                )
                              ]
                          )
                      ),
                    ],
                  ),
                ),
                CommanFunction.blankSpace(height*0.01, 0),
                SizedBox(
                  height: height*0.06,
                  child: TextField(
                    cursorColor: black,
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'First and Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: secondaryColor)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: grey)
                      )
                    ),
                  ),
                ),
                CommanFunction.blankSpace(height*0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            currentCountryCode = '+${value.phoneCode}';
                          },);
                      },
                      child: Container(
                        height: height*0.06,
                        width: width*0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: grey
                            ),
                            color: greyShade2,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(currentCountryCode,style: textThem.headlineSmall!.copyWith(fontWeight: FontWeight.w500),),
                      ),
                    ),
                    SizedBox(
                      height: height*0.06,
                      width: width*0.62,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: mobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: secondaryColor)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: grey)
                          ),
                        ),
                        cursorColor: black,
                      ),
                    )
                  ],
                ),
                CommanFunction.blankSpace(height*0.02, 0),
                Text(
                    'By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon.\nMessage and data rates may apply.',
                  style: textThem.bodyMedium,
                ),
                CommanFunction.blankSpace(height*0.02, 0),
                CommonAuthButton(title: 'Continue',onPressed: () {},btnWidth: 0.88,),
                CommanFunction.blankSpace(height*0.02, 0),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'By Continuing you agree Amazon\'s ',
                          style: textThem.labelLarge
                      ),
                      TextSpan(
                          text: 'Conditions of use ',
                          style: textThem.labelLarge!.copyWith(color: blue)
                      ),
                      TextSpan(
                          text: 'and ',
                          style: textThem.labelLarge
                      ),
                      TextSpan(
                          text: 'Privacy Notice',
                          style: textThem.labelLarge!.copyWith(color: blue)
                      )
                    ]
                )),
              ],
            ),
          ),
          Container(
            height: height*0.06,
            width: width,
            decoration: BoxDecoration(
              color: greyShade1,
              border: Border(
                top: BorderSide(
                    color: greyShade3
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width*0.03
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  inLogin=true;
                });
              },
              child: Row(
                children: [
                  Container(
                    height: height*0.03,
                    width: height*0.03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height*0.015,
                      color: inLogin ? secondaryColor: transparent,
                    ),
                  ),
                  CommanFunction.blankSpace(0, width*0.02),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Sign In. ',
                                style: textThem.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text: 'Already a Customer?',
                                style: textThem.bodyMedium
                            )
                          ]
                      )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class CommonAuthButton extends StatelessWidget {
   CommonAuthButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.btnWidth
  });
  String title;
  VoidCallback onPressed;
  double btnWidth;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textThem = Theme.of(context).textTheme;
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width*btnWidth, height*0.06 ),
            backgroundColor: amber,
            shape: const RoundedRectangleBorder()
        ),
        child: Text(title,
            style: textThem.headlineSmall
        )
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textThem,
  });

  final double width;
  final double height;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [white,grey,white])
          ),
        ),
        CommanFunction.blankSpace(height*0.02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Condition of Use',
            style: textThem.bodyMedium!.copyWith(color: blue),),
            Text('Privacy Notice',
              style: textThem.bodyMedium!.copyWith(color: blue),),
            Text('Help',
              style: textThem.bodyMedium!.copyWith(color: blue),)
          ],
        ),
        CommanFunction.blankSpace(height*0.01, 0),
        Center(child: Text('1996-2023, Amazon.com, Inc. or its affiliates',style: textThem.labelMedium!.copyWith(color: grey),))
      ],
    );
  }
}
