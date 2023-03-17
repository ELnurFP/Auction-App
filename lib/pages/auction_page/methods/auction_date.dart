import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/size.dart';

Container actionDate(BuildContext context, DateTime? date, String? address) {
  print('date $date');
  return Container(
    height: getHeight(45, context),
    // padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffF7F6F6)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            SvgPicture.asset('assets/icons/calendar.svg'),
            SizedBox(width: getWidth(10, context)),
            Text(
              '${date!.day}.${date.month}.${date.year}',
              style: const TextStyle(color: Color(0xff8F8D8D)),
            ),
          ],
        ),
        Container(
          width: getWidth(1, context),
          height: getHeight(30, context),
          color: const Color(0xffEDEDED),
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/clock.svg'),
            SizedBox(width: getWidth(10, context)),
            Text('${date.hour}:${date.minute}',
                style: const TextStyle(color: Color(0xff8F8D8D))),
          ],
        ),
        Container(
          width: getWidth(1, context),
          height: getHeight(30, context),
          color: const Color(0xffEDEDED),
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/location.svg'),
            SizedBox(width: getWidth(10, context)),
            Text(address!, style: const TextStyle(color: Color(0xff8F8D8D))),
          ],
        ),
      ],
    ),
  );
}
