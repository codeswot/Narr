import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/blockchain/wallet/confirm_transfer.dart';
import 'package:narr/shared/themes/colors.dart';

import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController amount = TextEditingController();
  TextEditingController recipient = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              height: 100,
              child: SvgPicture.asset(
                'assets/svg/transfer.svg',
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: PrimaryCard(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer Tokens',
                        style: TextStyle(color: NarrColors.royalGreen),
                      ),
                      SizedBox(height: 7),
                      Divider(thickness: 0.8),
                      Text('Recipient Email (Narr Email)'),
                      SizedBox(height: 3),
                      TextField(
                        controller: recipient,
                        decoration: InputDecoration(
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text('Amount(Tokens)'),
                      SizedBox(height: 3),
                      TextField(
                        controller: amount,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: PrimaryRaisedButton(
                          buttonTitle: 'Continue',
                          onTap: (start, stop, btnState) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              narrService.routerService.nextRoute(
                                context,
                                ConfirmTransfer(
                                  amountToken: amount.text,
                                  recipient: recipient.text,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
