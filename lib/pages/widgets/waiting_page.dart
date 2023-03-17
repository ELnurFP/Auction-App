import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qobustan/models/auksion_model/auction_model.dart';

import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../../utils/size.dart';
import 'custom_elevate_button.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key, required this.startModel});

  final StartAuctionModel startModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: getHeight(20, context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset('assets/images/sansclock.svg'),
            Text(
              startModel.message!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getHeight(10, context),
            ),
            //{startModel.startDate!.hour}:${startModel.startDate!.minute}-${startModel.startDate!.day}:
            Text(
              "${startModel.startDate!.day}:${startModel.startDate!.month}:${startModel.startDate!.year} / ${startModel.startDate!.hour}:${startModel.startDate!.minute}",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            customElevateButton(context, () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.home, (Route<dynamic> route) => false);
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
