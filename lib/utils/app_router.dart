import 'package:flutter/material.dart';
import 'package:qobustan/utils/routes.dart';

import '../pages/auction_page/auction_detail.dart';
import '../pages/auction_page/auction_is_start/real_auction_time.dart';
import '../pages/auction_page/methods/lot_detail.dart';
import '../pages/home.dart';
import '../pages/login/login_page.dart';
import '../pages/no_internet_page.dart';
import '../pages/onboard/onboard_page.dart';
import '../pages/splash/animated_splash.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const AnimatedSplash(),
        );
      case Routes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomePage(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      // case Routes.waiting:
      //   return MaterialPageRoute(
      //      settings: settings,
      //     builder: (context) =>  WaitingPage(),
      //   );
      case Routes.realTimeAuction:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RealTimeAuction(),
        );

      case Routes.onBoard:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.lotDetail:
        return MaterialPageRoute(builder: (_) => LotDetailPage());

      case Routes.auctionDetailed:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AuctionDetail());
      case Routes.noInternet:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const NoInternetPage());
      default:
        throw UnimplementedError('No defined route: ${settings.name}');
    }
  }
}
