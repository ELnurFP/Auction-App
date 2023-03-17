import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogHelper {
  static showToast(BuildContext context, String text) {
    var fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: Colors.red),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_rounded, color: Colors.white70),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 3));
  }
}
