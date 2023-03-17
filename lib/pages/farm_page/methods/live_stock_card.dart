import 'package:flutter/material.dart';
import '../../../utils/size.dart';

Padding liveStockCard(BuildContext context, String key, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getWidth(10, context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: const TextStyle(
              color: Color(0xff7B7B7B),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Color(0xff7B7B7B),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
