import 'package:amazon/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:amazon/features/checkout/presentation/widget/payment_methods_bottom_sheet.dart';
import 'package:amazon/features/checkout/presentation/widget/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import '../manager/payment_cubit.dart';
import 'order_info_item.dart';class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18,),
          Expanded(child: Image.asset('assets/images/todays_deals/todaysDeal1.png')),
          const SizedBox(height: 24,),
          const OrderInfoItem(title: 'Order Subtotal',price: '\$42.97',),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: 'Discount', price: '\$0'),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: 'Shipping', price: '\$8'),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 34,
          ),
          const TotalPrice(totalPrice: 'Total', price: '\$50.97'),
          const SizedBox(height: 16,),
          CustomButton(textButton: 'Complete Payment',onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetailsView(),));
            showBottomSheet(context: context, builder: (context) {
              return BlocProvider(
                create: (context) => PaymentCubit(CheckoutRepoImpl()),
                  child: const PaymentMethodsBottomSheet());
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
          },),
          const SizedBox(height: 12,)
        ],
      ),
    );
  }
}
