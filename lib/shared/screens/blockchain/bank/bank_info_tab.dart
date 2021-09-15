import 'package:flutter/material.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/credit_card.dart';

class BankInfoTab extends StatelessWidget {
  const BankInfoTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              creditCard(
                cardNumber: '3546 7532 XXXX 9742',
                cardHolder: currentUser.user.fullName,
                cardExpiration: '08/22',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
