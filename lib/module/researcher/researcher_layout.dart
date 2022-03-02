import 'package:flutter/material.dart';
import 'package:narr/shared/screens/dashboard.dart';
import 'package:narr/shared/themes/colors.dart';

class ResearcherApp extends StatefulWidget {
  const ResearcherApp({Key? key}) : super(key: key);

  @override
  _ResearcherAppState createState() => _ResearcherAppState();
}

class _ResearcherAppState extends State<ResearcherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Narr Researcher',
      theme: ThemeData(
        primaryColor: NarrColors.royalGreen,
        primarySwatch: Colors.green,
      ),
      home: Dashboard(),
    );
  }
}
