import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RouterService {
  void popRoute(BuildContext context) {
    Navigator.pop(context);
  }

  void nextRoute(BuildContext context, Widget widget) {
    Navigator.push(context,
        CupertinoPageRoute<Widget>(builder: (BuildContext context) => widget));
  }

  void popReplaceRoute(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context,
        CupertinoPageRoute<Widget>(builder: (BuildContext context) => widget));
  }

  void popUntil(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute<Widget>(builder: (BuildContext context) => widget),
        (Route<dynamic> route) => false);
    ModalRoute.withName('/');
  }

  void popDialog(BuildContext context, bool? value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }

  void exitApp() {
    SystemChannels.platform.invokeMethod<String>('SystemNavigator.pop');
  }
}
