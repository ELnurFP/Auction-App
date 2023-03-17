import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/size.dart';

Center splashTitle(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/bufalo.svg',
          height: getHeight(130, context),
        ),
        SizedBox(height: getHeight(15, context)),
        Text('Qobustan Heyvandarlıq\nNümayiş Kompleksi',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white)),
      ],
    ),
  );
}
