import 'package:flutter/material.dart';


import '../../../utils/size.dart';

Padding dashboarTitle(Function() onTap, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        left: getWidth(24, context),
        right: getWidth(24, context),
        top: getHeight(50, context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Faydalı Məlumatlar',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        // IconButton(
        //   onPressed: onTap,
        //   icon: SvgPicture.asset(
        //     'assets/icons/search.svg',
        //     width: getWidth(24, context),
        //     height: getWidth(24, context),
        //   ),
        // ),
      ],
    ),
  );
}
