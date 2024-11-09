import 'package:amazon/stripe_payment/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: ()=>PaymentManager.makePayment(40, "EGP"), 
            child: Text("Pay 20 dollar"),
            )
        ],
      ),
    );
  }
}