import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../../utils/size.dart';
import '../../widgets/custom_elevate_button.dart';

Future<void> dialogBuilder(
    BuildContext context, bool win, String userName, bool auctionEnd) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: double.infinity,
          height: getHeight(500, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: win ? kPrimaryColor : kLooserBg,
          ),
          padding: EdgeInsets.symmetric(horizontal: getHeight(20, context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //   const Spacer(),
              win
                  ? SvgPicture.asset('assets/images/winner.svg')
                  : SvgPicture.asset('assets/images/auction.svg'),
              SizedBox(
                height: getHeight(30, context),
              ),
              Text(
                win ? 'Təbrik edirik' : 'Auksion bitdi!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getHeight(10, context),
              ),
              Text(
                win
                    ? 'Auksionun qalibi siz oldunuz'
                    : 'Auksionun qalibi $userName oldu.',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getHeight(20, context),
              ),
              // const Spacer(),
              customElevateButton(context, () {
                auctionEnd
                    ? Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.home, (Route<dynamic> route) => false)
                    : Navigator.pop(context);
              }, false, 'Bağla'),
            ],
          ),
        ),
      );
    },
  );
}
