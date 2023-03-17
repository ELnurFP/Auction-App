import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color.dart';
import '../../utils/size.dart';
import '../widgets/custom_elevate_button.dart';

class AuctionResultPage extends StatelessWidget {
  const AuctionResultPage({Key? key, required this.name, required this.win})
      : super(key: key);
  final String name;
  final bool win;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: win ? kPrimaryColor : kLooserBg,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: getHeight(20, context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            win
                ? SvgPicture.asset('assets/images/winner.svg')
                : SvgPicture.asset('assets/images/auction.svg'),
            SizedBox(
              height: getHeight(50, context),
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
                  : 'Auksionun qalibi $name oldu.',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            customElevateButton(context, () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            }, false, 'Ana Səhifəyə qayıt'),
            SizedBox(
              height: getHeight(23, context),
            ),
          ],
        ),
      ),
    );
  }
}
