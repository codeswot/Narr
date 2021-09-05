import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/auth/login.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/form_card.dart';

class VerifyAccount extends StatefulWidget {
  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00a368),
      appBar: AppBar(
        backgroundColor: Color(0xff00a368),
        title: Text('Verify Account'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: FormCard(
                child: Column(
                  children: [
                    Text(
                      'Congratulations',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Thank you for Signing up with Narr\n please check your email and verify your account',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PrimaryRaisedButton(
                      buttonTitle: 'Login',
                      onTap: (startLoading, stopLoading, btnState) {
                        narrService.routerService.nextRoute(context, Login());
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
