import 'package:flutter/material.dart';

import '../../../utils/size.dart';

Container cowImage(BuildContext context, String text, String imageUrl) {
  return Container(
    // height: getHeight(500, context),
    width: getWidth(190, context),
    padding: EdgeInsets.symmetric(
        horizontal: getWidth(16, context), vertical: getHeight(16, context)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: NetworkImage(
          imageUrl,
        ),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Text>[
        Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
