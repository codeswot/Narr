import 'package:flutter/material.dart';
import 'package:narr/shared/screens/auth_screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NARR',
      theme: ThemeData(
        primaryColor: Color(0xff00a368),
        primarySwatch: Colors.green,
      ),
      home: Login(),
    );
  }
}
