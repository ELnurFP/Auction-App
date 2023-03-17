import 'package:flutter/material.dart';
import 'package:qobustan/pages/onboard/methods/skip_button.dart';

import '../../../providers/onboard_provider.dart';
import '../../../utils/color.dart';
import '../../../utils/size.dart';
import '../../widgets/custom_elevate_button.dart';

Positioned changePage(
  BuildContext context,
  OnboardProvider state,
) {
  return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: getHeight(150, context),
        width: getWidth(375, context),
        child: Column(
          children: [
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: getHeight(8, context),
                  width: getWidth(70, context),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 300),
                        height: state.currentPage == index ? 8 : 4,
                        width: state.currentPage == index ? 8 : 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.currentPage == index
                              ? kPrimaryColor
                              : Colors.grey,
                        ),
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: getHeight(20, context)),
            customElevateButton(context, () {
              if (state.controller.page!.toInt() == 4) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              } else {
                state.controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }
            }, true, 'Dəvam et'
                // : 'Qeydiyyatdan keçin'
                ),
            // SizedBox(
            //   height: getHeight(10, context),
            // ),
            skipButton(context)
          ],
        ),
      ));
}
