import 'dart:developer';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:amazon/view/auth_screen/sign_in_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class AuthService{

  static bool checkAuthentication(){
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? user = firebaseAuth.currentUser;
    if(user!=null){
      return true;
    }
    else{
      return false;
    }
  }

  static receiveOTP({required BuildContext context,required String mobileNumber})async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try{
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
          verificationCompleted: (phoneAuthCredential) {
            log(phoneAuthCredential.toString());
          },
          verificationFailed: (error) {
            log(error.toString());
          },
          codeSent: (verificationId, forceResendingToken) {
          context.read<AutProvider>().updatePhoneVerificationId(verID: verificationId);
          context.read<AutProvider>().updatePhoneNum(num: mobileNumber);
            Navigator.push(
                context,
                PageTransition(
                    child: OTPScreen(mobileNumber: mobileNumber),
                    type: PageTransitionType.rightToLeft));
          },
          codeAutoRetrievalTimeout: (verificationId) {

          },);
    }
    catch(e){
      log(e.toString());
    }
  }

  static verifyOtp({required BuildContext context,required String otp})async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try{
      AuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: context.read<AutProvider>().verificationId,
          smsCode: otp);
      await firebaseAuth.signInWithCredential(authCredential);
      Navigator.push(
          context,
          PageTransition(
              child: const SignInLogic(),
              type: PageTransitionType.rightToLeft));
    }
    catch(e){
      log(e.toString());
    }
  }
}