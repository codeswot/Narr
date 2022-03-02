import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';

import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class Cashout extends StatefulWidget {
  const Cashout({Key? key}) : super(key: key);

  @override
  _CashoutState createState() => _CashoutState();
}

class _CashoutState extends State<Cashout> {
  TextEditingController cashout = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashout'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            height: 100,
            child: SvgPicture.asset(
              'assets/svg/cash.svg',
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: PrimaryCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cashout/withdraw'),
                  SizedBox(height: 7),
                  Divider(thickness: 0.8),
                  Text('Amount(Tokens)'),
                  TextField(
                    controller: cashout,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        symbol: 'Narr ',
                        // decimalDigits: 1,
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '0',
                    ),
                  ),
                  Text(
                      '${narrService.utilityService.convertToNaira(narrService.utilityService.amountFormarter(cashout.text))} Naira'),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: PrimaryRaisedButton(
                      buttonTitle: 'Cashout',
                      onTap: (startLaoding, stop, btnState) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
