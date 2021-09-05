import 'dart:async';

import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/auth/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        silentLogin();
      },
    );
    super.initState();
  }

  silentLogin() async {
    narrService.routerService.nextRoute(context, Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Image.asset('assets/images/png/logo-narr.png',
                      width: 200),
                ),
              ),
              SizedBox(height: 10),
              CircularProgressIndicator(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
