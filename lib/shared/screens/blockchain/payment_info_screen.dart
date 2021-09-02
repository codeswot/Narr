import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narr/shared/screens/blockchain/wallet/wallet_tab.dart';

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({Key? key}) : super(key: key);

  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(' Bank/Wallet'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text('Wallet details'),
                  ),
                  Tab(
                    child: Text('Bank details'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            WalletTab(),
            // BankInfoTab(),
            Container(
              child: Center(
                child: Text('Bank info'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
