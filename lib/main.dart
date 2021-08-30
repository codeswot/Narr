import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:narr/shared/screens/splash_screen.dart';
import 'package:narr/shared/screens/third_party_services/crowd_funding/crowd_funding.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDir = await getApplicationDocumentsDirectory();
  var path = appDir.path;

  WidgetsFlutterBinding.ensureInitialized();
  Hive.init(path);

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
      home: CrowdFunding(),
    );
  }
}
