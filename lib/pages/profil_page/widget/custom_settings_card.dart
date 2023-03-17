import 'package:flutter/material.dart';

import '../../../utils/size.dart';

GestureDetector customSettingsCard(
    BuildContext context, String title, Function() onTap) {
  return GestureDetector(
    onTap: onTap,

    behavior: HitTestBehavior.translucent,
    // splashColor: Colors.transparent,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: getHeight(16, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  );
}
