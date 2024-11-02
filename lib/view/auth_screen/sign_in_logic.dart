import 'package:amazon/controller/services/auth_services/auth_service.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/user/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkAuthentication(){
    bool userIsAuthenticated = AuthService.checkAuthentication();
    userIsAuthenticated ? Navigator.pushAndRemoveUntil(
        context,
        PageTransition(child: HomeScreen(), type: PageTransitionType.rightToLeft),
        (route) => false): Navigator.pushAndRemoveUntil(
        context,
        PageTransition(child: AuthScreen(), type: PageTransitionType.rightToLeft),
            (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
