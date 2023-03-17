import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/size.dart';

Container startPrice(BuildContext context) {
  return Container(
      width: double.infinity,
      height: getHeight(50, context),
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(15, context), vertical: getHeight(10, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kDoneColor2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Başlanğıc məbləği',
            style: TextStyle(color: kDoneColor, fontSize: 14),
          ),
          Text(
            '5000 AZN',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ));
}
