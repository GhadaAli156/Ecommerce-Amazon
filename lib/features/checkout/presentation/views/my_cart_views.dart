import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widget/my_cart_view_body.dart';class MyCartViews extends StatelessWidget {
  const MyCartViews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}
