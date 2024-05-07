import 'package:fluttertoast/fluttertoast.dart';

void showToast(dynamic message) {
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.red,
      textColor: AppColors.white,
      fontSize: 14.0);
}
