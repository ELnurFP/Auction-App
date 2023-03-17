import 'package:flutter/material.dart';

TextButton skipButton(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamed(context, "/login");
    },
    child: const Text(
      "Skip for now",
      style: TextStyle(
        color: Color(0xffACACAC),
        fontSize: 14,
      ),
    ),
  );
}
