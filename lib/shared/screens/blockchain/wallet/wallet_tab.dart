import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/blockchain/wallet/cashout.dart';
import 'package:narr/shared/screens/blockchain/wallet/fund_wallet.dart';
import 'package:narr/shared/screens/blockchain/wallet/transfer.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/cards/wallet_card.dart';
import 'package:narr/shared/globals/global_var.dart';

// import 'package:flutter_paystack/flutter_paystack.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({
    Key? key,
  }) : super(key: key);

  @override
  _WalletTabState createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  TextEditingController transferAmount = TextEditingController();
  TextEditingController transferRecipient = TextEditingController();

  @override
  void initState() {
    _initPayStack();
    super.initState();
  }

  void _initPayStack() {
    // PaystackPlugin.initialize(publicKey: publicKey)
    //     .then((PaystackPlugin value) {
    //   print(value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryCard(
              color: NarrColors.royalGreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Estimated balance',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.coins,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          text: '2.5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: ' NARR COIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        narrService.routerService.nextRoute(
                          context,
                          FundWallet(),
                        );
                      },
                      child: WalletCard(
                        icon: Icons.account_balance_wallet_outlined,
                        color: Colors.blue,
                        title: 'Fund Wallet',
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        narrService.routerService.nextRoute(context, Cashout());
                      },
                      child: WalletCard(
                        icon: Icons.attach_money,
                        color: NarrColors.royalGreen,
                        title: 'Cashout',
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        narrService.routerService
                            .nextRoute(context, Transfer());
                      },
                      child: WalletCard(
                        icon: Icons.north_east,
                        color: Colors.red,
                        title: 'Transfer',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PrimaryCard(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Blockchain wallet',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: NarrColors.royalGreen,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(thickness: 0.8),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.shieldVirus,
                            size: 14,
                            color: NarrColors.royalGreen,
                          ),
                          SizedBox(width: 5),
                          Text('Address: '),
                          Flexible(
                            child: Text(
                              publicKey.toLowerCase(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBill,
                            size: 14,
                            color: NarrColors.royalGreen,
                          ),
                          SizedBox(width: 5),
                          Text('Token Balance: '),
                          Flexible(
                            child: Text(
                              '150 Narr coin',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBill,
                            size: 14,
                            color: NarrColors.royalGreen,
                          ),
                          SizedBox(width: 5),
                          Text('Token Equivelence (Naira): '),
                          Flexible(
                            child: Text(
                              'N15,000',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBill,
                            size: 14,
                            color: NarrColors.royalGreen,
                          ),
                          SizedBox(width: 5),
                          Text('Current Rate: '),
                          Flexible(
                            child: Text(
                              '1 Narr coin = 10,000 Naira',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 11),
                      // Text('Download wallet'),
                      SizedBox(height: 11),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.ethereum,
                            size: 14,
                            color: NarrColors.royalGreen,
                          ),
                          SizedBox(width: 5),
                          Text('Gas Balance: '),
                          Text('1.583 Eth'),
                        ],
                      ),
                      SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          text: 'Note:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  'If you want to manage your wallet externally, you can download ',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 32),
                      PrimaryRaisedButton(
                        onTap: (startLoading, stopLoading, btnState) {},
                        buttonTitle: 'Download wallet',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
