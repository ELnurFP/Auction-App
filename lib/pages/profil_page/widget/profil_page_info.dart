import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../utils/size.dart';

Center profilPageInfoWidget(
    BuildContext context, String fullName, String phone, Uint8List bytes) {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          width: getWidth(100, context),
          height: getWidth(100, context),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(196, 196, 196, 1),
            border: Border.all(
              color: const Color.fromRGBO(231, 231, 231, 1),
              width: 2,
            ),
            image:
                DecorationImage(image: MemoryImage(bytes), fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.elliptical(90, 90)),
          ),
        ),
        SizedBox(
          height: getHeight(16, context),
        ),
        Text(
          fullName,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromRGBO(6, 21, 43, 1),
              fontFamily: 'Poppins',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
        SizedBox(
          height: getHeight(16, context),
        ),
        Text(
          '(+994) $phone',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
        SizedBox(
          height: getHeight(16, context),
        ),
      ],
    ),
  );
}
