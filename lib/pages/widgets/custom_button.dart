import 'package:flutter/material.dart';

import '../../utils/size.dart';

GestureDetector customButton(BuildContext context, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: getHeight(57, context),
      width: getWidth(330, context),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(182, 215, 165, 0.23999999463558197),
              offset: Offset(0, 10),
              blurRadius: 30)
        ],
        color: Color.fromRGBO(62, 137, 84, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: const Center(
        child: Text(
          'Göndər',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
              fontSize: 14,
              letterSpacing: 0.5,
              fontWeight: FontWeight.normal,
              height: 1.5 /*PERCENT not supported*/
              ),
        ),
      ),
    ),
  );
}
