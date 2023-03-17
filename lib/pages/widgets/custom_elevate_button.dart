import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/size.dart';

ElevatedButton customElevateButton(
    BuildContext context, Function() onTap, bool isPrimary, String text) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: isPrimary ? kPrimaryColor : Colors.white,
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        height: getHeight(60, context),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isPrimary ? Colors.white : Colors.black,
            ),
          ),
        ),
      ));
}
