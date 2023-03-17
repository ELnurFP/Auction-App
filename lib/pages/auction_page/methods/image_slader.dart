import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/config/configs.dart';

import '../../../providers/pageview_provider.dart';
import '../../../utils/size.dart';

ChangeNotifierProvider<PageViewProvider> imageSlider(
    BuildContext context, List<dynamic> images) {
  return ChangeNotifierProvider(
    create: (_) => PageViewProvider(),
    child: Consumer<PageViewProvider>(
      builder: ((context, state, child) => Container(
            height: getHeight(200, context),
            width: getWidth(375, context),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              children: [
                PageView.builder(
                    controller: state.pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: getHeight(200, context),
                        width: getWidth(375, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${Configs.baseURL}/${images[index]!}"),
                              fit: BoxFit.cover),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                      );
                    },
                    itemCount: images.length),
                Positioned(
                    bottom: getHeight(0, context),
                    right: getWidth(0, context),
                    left: getWidth(0, context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (state.pageController.page != 0) {
                                state.pageController.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
                            },
                            splashColor: Colors.transparent,
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: getWidth(15, context),
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              if (state.pageController.page != 3) {
                                state.pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
                            },
                            splashColor: Colors.transparent,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: getWidth(15, context),
                              color: Colors.white,
                            )),
                      ],
                    ))
              ],
            ),
          )),
    ),
  );
}
