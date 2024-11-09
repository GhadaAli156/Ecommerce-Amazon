import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/stripe_payment/stripe_key.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:amazon/view/auth_screen/sign_in_logic.dart';
import 'package:amazon/view/user/home/home_page.dart';
import 'package:amazon/view/user/profile/profile_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = ApiKeys.pusblishableKey;
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AutProvider>(create: (context) => AutProvider(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),

    );
  }
}
