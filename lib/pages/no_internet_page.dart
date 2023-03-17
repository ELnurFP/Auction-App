import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/pages/splash/animated_splash.dart';
import 'package:qobustan/providers/global_provider.dart';
import 'package:qobustan/utils/routes.dart';
import 'package:qobustan/utils/size.dart';

import '../utils/color.dart';
import 'onboard/onboard_page.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(20, context),
          vertical: getHeight(25, context),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/images/noint.svg',
              height: getHeight(198, context),
              width: getWidth(277.6, context),
            ),
            SizedBox(
              height: getHeight(30, context),
            ),
            const Text(
              'Bağlantı Xətası',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: getHeight(10, context),
            ),
            const Text(
              'Zəhmət olmasa internet bağlantınızı yoxlayın.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: kLooserBg,
                ),
                onPressed: () {
                  context.read<GlobalProvider>().checkInternet();
                  context.read<GlobalProvider>().hasConnection
                      ? GetStorage().read('token') != null
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, Routes.home, (route) => false)
                          : Navigator.pushReplacement(
                              context, PageTransition(const OnboardingScreen()))
                      : log('no connection');
                },
                child: SizedBox(
                  width: double.infinity,
                  height: getHeight(60, context),
                  child: Center(
                    child: Text(
                      'Yenilə',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
