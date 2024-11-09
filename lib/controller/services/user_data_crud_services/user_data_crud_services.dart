// import 'dart:developer';
//
// import 'package:amazon/constants/comman_function.dart';
// import 'package:amazon/constants/constants.dart';
// import 'package:amazon/model/user_model.dart';
// import 'package:amazon/view/auth_screen/auth_screen.dart';
// import 'package:amazon/view/auth_screen/sign_in_logic.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
//
// class UserDataCRUD{
//   static addNewUser({required UserModel userModel, required BuildContext context}) async{
//     try{
//       await firestore.collection('users').doc(auth.currentUser!.phoneNumber).set(userModel.toMap()).whenComplete(() {
//         log('Data Added');
//         CommanFunction.showToast(context: context, message: 'User Added Successful');
//         Navigator.pushAndRemoveUntil(context, PageTransition(child: AuthScreen(), type: PageTransitionType.rightToLeft), (route) => false,);
//       });
//     }catch(e){
//       log(e.toString());
//       CommanFunction.showToast(context: context, message: e.toString());
//     }
//   }
//   static Future<bool> checkUser()async {
//     bool userPresent = false;
//     try {
//       await firestore.collection('users').where(
//           'mobileNumber', isEqualTo: auth.currentUser!.phoneNumber).get().then((
//           value) => value.size > 0 ? userPresent=true : userPresent=false,);
//     }catch(e){
//       log(e.toString());
//     }
//     log(userPresent.toString());
//     return userPresent;
//   }
// }