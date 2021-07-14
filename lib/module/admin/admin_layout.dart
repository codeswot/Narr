import 'package:flutter/material.dart';
import 'package:narr/shared/screens/dashboard.dart';
import 'package:narr/shared/themes/colors.dart';

class AdminApp extends StatefulWidget {
  const AdminApp({Key? key}) : super(key: key);

  @override
  _AdminAppState createState() => _AdminAppState();
}

class _AdminAppState extends State<AdminApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Narr Admin',
      theme: ThemeData(
        primaryColor: NarrColors.chocolateBrown,
        primarySwatch: Colors.brown,
      ),
      home: Dashboard(),
    );
  }
}
