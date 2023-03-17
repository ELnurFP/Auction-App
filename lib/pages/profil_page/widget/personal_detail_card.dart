import 'package:flutter/material.dart';

import '../../../utils/size.dart';

Container personalDetailCard(
  BuildContext context,
  String title,
) {
  return Container(
    width: getWidth(343, context),
    height: getHeight(53, context),
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(
      horizontal: getWidth(16, context),
    ),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      color: const Color.fromRGBO(255, 255, 255, 1),
      border: Border.all(
        color: const Color.fromRGBO(231, 231, 231, 1),
        width: 1,
      ),
    ),
    child: Text(
      title,
      style: const TextStyle(
          color: Color.fromRGBO(139, 139, 139, 1),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          height: 1),
    ),
  );
}
