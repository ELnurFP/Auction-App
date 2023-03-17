import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qobustan/pages/onboard/onboard_page.dart';
import 'package:qobustan/utils/routes.dart';
import '../../services/remote/fcm_service.dart';
import '../../utils/color.dart';
import '../../utils/size.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController? _controller;
  Animation<double>? animation1;
  final box = GetStorage();
  bool hasConnection = false;
  _sendFCMToken() async {
    GetStorage().read('notifyToken') != null
        ? await FCMService.sentFcmToken()
        : null;
  }

  void checkInternet() async {
    hasConnection = await InternetConnectionChecker().hasConnection;
  }

  @override
  void initState() {
    super.initState();

    checkInternet();

    //print(GetStorage().read('token'));
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        if (mounted) {
          setState(() {
            _textOpacity = 1.0;
          });
        }
      });

    _controller!.forward();

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _fontSize = 1.1;
        });
      }
    });

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _containerSize = 2;
          _containerOpacity = 1;
        });
      }
    });
    _sendFCMToken();
    _navigateApp();
  }

  _navigateApp() async {
    await FirebaseMessaging.instance.subscribeToTopic("helloworld");

    await Future.delayed(const Duration(seconds: 3), () {
      box.read('token') != null
          ? hasConnection
              ? Navigator.pushReplacementNamed(context, '/home')
              : Navigator.pushReplacementNamed(context, Routes.noInternet)
          : Navigator.pushReplacement(
              context, PageTransition(const OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'Qobustan Heyvandarlıq\nNümayiş Kompleksi',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: width / _containerSize,
                  width: width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset("assets/images/appicon.png")
                  // SvgPicture.asset(
                  //   'assets/images/bufalo.svg',
                  //   height: getHeight(150, context),
                  // ),
                  ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 0,
              child: Image.asset('assets/images/cutting_bufalo.png',
                  height: getHeight(400, context))),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
