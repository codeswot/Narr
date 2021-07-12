import 'package:fluttertoast/fluttertoast.dart';

class DialogInfoService {
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
