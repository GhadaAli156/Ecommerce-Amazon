import 'package:amazon/controller/services/auth_services/auth_service.dart';
import 'package:amazon/controller/services/user_data_crud_services/user_data_crud_services.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:amazon/view/user/user_persistant_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {

  // checkUser() async{
  //   bool userAlreadyThere = await UserDataCRUD.checkUser();
  //   if(userAlreadyThere==true){
  //     Navigator.push(context,
  //         PageTransition(child: const UserBottomNavBar(), type: PageTransitionType.rightToLeft));
  //   }else{
  //     Navigator.push(context,
  //         PageTransition(child: const UserDataInputScreen(), type: PageTransitionType.rightToLeft));
  //   }
  // }

  checkAuthentication(){
    bool userIsAuthenticated = AuthService.checkAuthentication();
    // userIsAuthenticated ? checkUser(): Navigator.pushAndRemoveUntil(
    //     context,
    //     PageTransition(child: AuthScreen(), type: PageTransitionType.rightToLeft),
    //         (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
