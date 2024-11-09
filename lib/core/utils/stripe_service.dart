import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../features/checkout/data/model/ephemeral_key_model/ephemeral_key_model.dart';
import '../../features/checkout/data/model/init_payment_sheet_input_model.dart';
import '../../features/checkout/data/model/payment_intent_input_model.dart';
import '../../features/checkout/data/model/payment_intint_model/payment_intent_model.dart';
import '../../stripe_payment/stripe_key.dart';
import 'api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  //paymentIntentObject create payment intent (amount,currency)
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  //init payment sheet
  Future initPaymentSheet({required InitiPaymentSheetInputModel initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
            customerEphemeralKeySecret: initiPaymentSheetInputModel.ephemeralKeySecret,
            //customerId: 'cus_QqAeX7FWo25wX3',
            customerId: initiPaymentSheetInputModel.customerId,
            merchantDisplayName: 'Ghada'));
  }

  //presentPaymentSheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //call 3 function
  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.cusomerId);
    var initiPaymentSheetInputModel = InitiPaymentSheetInputModel(clientSecret: paymentIntentModel.clientSecret!, customerId: paymentIntentInputModel.cusomerId, ephemeralKeySecret: ephemeralKeyModel.secret!);

    await initPaymentSheet(initiPaymentSheetInputModel: initiPaymentSheetInputModel);
    await displayPaymentSheet();
  }


  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: {
          'customer': customerId
        },
        headers: {
          'Authorization':'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20'
        },
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey);

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
