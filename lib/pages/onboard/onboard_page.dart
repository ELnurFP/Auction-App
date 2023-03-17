import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/onboard_provider.dart';
import '../../utils/size.dart';
import 'methods/change_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardProvider(),
      child: Scaffold(
        body: Consumer<OnboardProvider>(builder: (context, state, child) {
          return Stack(
            children: [
              PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: state.controller,
                onPageChanged: (index) {
                  state.changeCurrentPage(index);
                },
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: getHeight(50, context),
                          ),
                          Container(
                            width: getWidth(250, context),
                            height: getHeight(500, context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      state.pages[index]["image"] as String),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(
                            height: getHeight(10, context),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                state.pages[index]["title"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.pages[index]["subtitle"],
                                style: const TextStyle(
                                    color: Color(0xff8F9098),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ))
                        ],
                      ));
                }),
              ),
              changePage(context, state),
              //skipButton(context),
              //skipButton(context)
            ],
          );
        }),
      ),
    );
  }
}
