import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:narr/shared/screens/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDir = await getApplicationDocumentsDirectory();
  var path = appDir.path;

  WidgetsFlutterBinding.ensureInitialized();
  Hive.init(path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NARR',
      theme: ThemeData(
        primaryColor: const Color(0xff00a368),
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}
