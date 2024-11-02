import 'package:flutter/material.dart';

class AutProvider extends ChangeNotifier{
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  updatePhoneNum({required String num}){
    phoneNumber= num;
    notifyListeners();
  }

  updatePhoneVerificationId({required String verID}){
    verificationId= verID;
    notifyListeners();
  }
}