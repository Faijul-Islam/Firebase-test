import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

// class PaymentController {
//
//   Map<String, dynamic>? paymentIntentData;
//
//   Future<void> makePayment(
//       {required String amount, required String currency}) async {
//     try {
//       paymentIntentData = await createPaymentIntent(amount, currency);
//       if (paymentIntentData != null) {
//         await Stripe.instance.initPaymentSheet(
//             paymentSheetParameters: SetupPaymentSheetParameters(
//               applePay: ,
//               googlePay: true,
//               testEnv: true,
//               merchantCountryCode: 'US',
//               merchantDisplayName: 'Prospects',
//               customerId: paymentIntentData!['customer'],
//               paymentIntentClientSecret: paymentIntentData!['client_secret'],
//               customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
//             ));
//         displayPaymentSheet();
//       }
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       print('Payment Successful');
//     } on Exception catch (e) {
//       if (e is StripeException) {
//         print("Error from Stripe: ${e.error.localizedMessage}");
//       } else {
//         print("Unforeseen error: ${e}");
//       }
//     } catch (e) {
//       print("exception:$e");
//     }
//   }
//
//   //  Future<Map<String, dynamic>>
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       var response = await https.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization':
//             'Bearer sk_test_51Kq0GcBiAEe8BrCZn4uaHC00xnR1xrUgAs9CmYFDigL3Yizk6KFwcF0se66R1tSrJOT2cAw5nHU87T5lgedPJdjd00rdsZPecL',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//   }
//
//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }
// }
