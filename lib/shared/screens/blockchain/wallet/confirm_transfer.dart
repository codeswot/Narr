import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ConfirmTransfer extends StatefulWidget {
  const ConfirmTransfer({
    required this.amountToken,
    required this.recipient,
  });
  final String amountToken;
  final dynamic recipient;

  @override
  _ConfirmTransferState createState() => _ConfirmTransferState();
}

class _ConfirmTransferState extends State<ConfirmTransfer> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryCard(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                    child: Column(
                      children: [
                        Center(
                          child: Text('Amount to send'),
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text: '-${widget.amountToken}',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'NC',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            text: ' = ',
                            style: TextStyle(
                                fontSize: 14, fontStyle: FontStyle.italic),
                            children: [
                              TextSpan(
                                text:
                                    '-${narrService.utilityService.convertToNarrCoin(narrService.utilityService.amountFormarter(widget.amountToken))} naira',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'Nunito'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PrimaryCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From Me',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: NarrColors.royalGreen,
                          ),
                        ),
                        Divider(),
                        Text(
                          '${currentUser.user.id}'.toLowerCase(),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: NarrColors.royalGreen,
                          ),
                        ),
                        Divider(),
                        Text('${widget.recipient}'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PrimaryRaisedButton(
                onTap: (startLoading, stopLoading, buttonState) {
                  startLoading();

                  narrService.dialogInfoService
                      .showDialog(
                          title: 'In progress',
                          subtitle: 'Please wait transaction in progress',
                          alertType: AlertType.info,
                          context: context)
                      .then((value) {});
                  stopLoading();
                },
                buttonTitle: 'Confirm',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationSheet extends StatelessWidget {
  const ConfirmationSheet({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Icon(
            Icons.check_circle,
            size: 90,
            color: NarrColors.royalGreen,
          ),
          Text(
            'Successful',
            style: TextStyle(fontSize: 21),
          ),
          Text(message),
        ],
      ),
    );
  }
}
