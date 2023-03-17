import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/size.dart';

Row bidEndTime(BuildContext context, String timer) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Your Bid',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Row(
        children: [
          SvgPicture.asset('assets/icons/stopwatch.svg'),
          SizedBox(
            width: getWidth(7, context),
          ),
          Text(
            timer,
            style: const TextStyle(
                color: Color(0xFFA94848),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )
        ],
      )
    ],
  );
}
