import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
