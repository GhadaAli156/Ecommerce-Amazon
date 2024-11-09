import 'package:amazon/features/checkout/presentation/widget/payment_methods_List_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import 'custom_credit_card.dart';
import 'thank_you_view.dart';
class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(formKey: formKey,autovalidateMode: autovalidateMode,),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12,left: 16,right: 16),
                child: CustomButton(textButton: 'Payment',
                onTap: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouView(),));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },),
              )),
        )
      ],
    );
  }
}
