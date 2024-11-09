import 'package:amazon/features/checkout/presentation/widget/thank_you_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/model/payment_intent_input_model.dart';
import '../manager/payment_cubit.dart';
import '../manager/payment_state.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit,PaymentState>(
      builder: (context, state) => CustomButton(
        onTap: () {
          PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: '200', currency: 'USD',cusomerId: 'cus_QqAeX7FWo25wX3');
          BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
        },
        isLoading: state is PaymentLoading? true:false,
          textButton: 'Continue'),
      listener: (context, state) {
        if(state is PaymentSuccess){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ThankYouCard(),));
        }
        if(state is PaymentFailure){
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );

  }
}