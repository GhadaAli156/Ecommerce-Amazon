import 'package:amazon/constants/comman_function.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/user/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.mobileNumber});
  String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
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
            horizontal: width * 0.03, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Authentication Required',
                style: textThem.headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              CommanFunction.blankSpace(height * 0.01, 0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: widget.mobileNumber,
                    style: textThem.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                TextSpan(text: ' Change', style: textThem.bodyMedium)
              ])),
              CommanFunction.blankSpace(height * 0.02, 0),
              Text(
                'We have send a One Time Password (OTP) to the mobile number above. Please enter it to complete verification',
                style: textThem.bodyMedium,
              ),
              CommanFunction.blankSpace(height * 0.02, 0),
              TextField(
                controller: otpController,
                cursorColor: black,
                decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: secondaryColor)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey))),
              ),
              CommanFunction.blankSpace(height * 0.02, 0),
              CommonAuthButton(
                title: 'Continue',
                onPressed: () {
                  String otp = otpController.text.trim();
                  if (otp.isNotEmpty) {
                    Provider.of<AutProvider>(context, listen: false)
                        .updatePhoneVerificationId(verID: otp);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter your otp')),
                    );
                  }
                },
                btnWidth: 0.94,
              ),
              CommanFunction.blankSpace(height * 0.01, 0),
              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend OTP',
                        style: textThem.bodyMedium!.copyWith(color: blue),
                      ))),
              CommanFunction.blankSpace(height * 0.01, 0),
              BottomAuthScreenWidget(
                  width: width, height: height, textThem: textThem)
            ],
          ),
        ),
      )),
    );
  }
}
