import 'package:flutter/material.dart';

import '../../../utils/size.dart';

Padding detailCard(BuildContext context, String catagoryName) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getWidth(10, context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          catagoryName,
          style: const TextStyle(
              color: Color(0xff7B7B7B),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        Text(
          catagoryName,
          style: const TextStyle(
              color: Color(0xff7B7B7B),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
