import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:narr/shared/globals/global_var.dart';

class PaymentService {
  String payStackKey = 'pk_test_225a9f8342058f3c6781f3a3c29c4c74a357348f';

  final _plugin = PaystackPlugin();

  void initPaystack() {
    _plugin.initialize(publicKey: payStackKey);
  }

  Future<CheckoutResponse> makePayment(
      {required int amount, required BuildContext context}) async {
    Charge charge = Charge()
      ..amount = amount
      ..putMetaData('fullName', currentUser.user.fullName)
      ..putMetaData('_id', currentUser.user.id)
      ..putMetaData('publicKey', publicKey)
      ..putMetaData('referral', 'NARR')
      ..card = PaymentCard(
          number: '4084084084084081',
          cvc: '408',
          expiryMonth: 07,
          expiryYear: 22)
      ..reference = DateTime.now().microsecondsSinceEpoch.toString()
      ..email = currentUser.user.email;
    CheckoutResponse response = await _plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );
    return response;
  }
}
