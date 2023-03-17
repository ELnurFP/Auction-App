import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/size.dart';

Padding auctionsTitle(BuildContext context, Function() onTap) {
  return Padding(
    padding: EdgeInsets.only(
      left: getWidth(24, context),
      right: getWidth(24, context),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Auksionlar',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text(
              'Hamısına bax',
              style: TextStyle(color: kDoneColor, fontSize: 12),
            ))
      ],
    ),
  );
}
