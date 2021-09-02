import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class FundWallet extends StatefulWidget {
  const FundWallet({Key? key}) : super(key: key);

  @override
  _FundWalletState createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {
  TextEditingController fundController = TextEditingController();
  _charge(context, {required num ammount}) async {
    // Charge charge = Charge()
    //   ..amount = ammount
    //   ..reference = 'test2'
    //   // or ..accessCode = _getAccessCodeFrmInitialization()
    //   ..email = 'elmubarak333@gmail.com';
    // CheckoutResponse response = await PaystackPlugin.checkout(
    //   context,
    //   method: CheckoutMethod.card,
    //   charge: charge,
    // );
    // print(response.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Wallet'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: SvgPicture.asset(
              'assets/svg/wallet.svg',
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: PrimaryCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fund Wallet',
                    style: TextStyle(color: NarrColors.royalGreen),
                  ),
                  SizedBox(height: 7),
                  Divider(thickness: 0.8),
                  Text('Ammount(Naira)'),
                  SizedBox(height: 8),
                  TextField(
                    controller: fundController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        symbol: '₦',
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
                  SizedBox(height: 3),
                  Text(
                    '${narrService.utilityService.convertToNarrCoin(narrService.utilityService.amountFormarter(fundController.text))} Narr coin',
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: PrimaryRaisedButton(
                      buttonTitle: 'Fund',
                      onTap: (startLoading, stopLoading, btnState) {
                        final num _currentAmount = narrService.utilityService
                            .amountFormarter(fundController.text);
                        _charge(context, ammount: _currentAmount);
                      },
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
