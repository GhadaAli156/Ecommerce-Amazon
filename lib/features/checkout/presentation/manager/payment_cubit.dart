import 'dart:developer';
import 'package:amazon/features/checkout/presentation/manager/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/payment_intent_input_model.dart';
import '../../data/repos/checkout_repo.dart';
import '../../data/repos/checkout_repo_impl.dart';

class PaymentCubit extends Cubit<PaymentState>{
  PaymentCubit(this.checkoutRepo):super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
    emit(PaymentLoading());

    var data = await CheckoutRepoImpl().makePayment(paymentIntentInputModel: paymentIntentInputModel);

    data.fold((l) => emit(PaymentFailure(l.errMessage)), (r) => PaymentSuccess(),);
  }

  void onChange(Change<PaymentState> change){
    log(change.toString());
    super.onChange(change);


  }

}