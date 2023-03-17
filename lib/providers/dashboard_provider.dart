import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/auksion_model/auction_model.dart';
import '../models/info_model/info_model.dart';
import '../pages/dashboard/methods/auctions_card.dart';
import '../pages/dashboard/methods/banner_card.dart';
import '../services/remote/auction_services.dart';
import '../services/remote/info_service.dart';
import '../utils/routes.dart';

class DashboardProvider extends ChangeNotifier {
  List<Widget> bannerCards = [];
  List<Widget> auctionCards = [];
  bool isAuctionLoading = false;
  bool isBannerLoading = false;
  bool _hasConnection = false;
  bool get hasConnection => _hasConnection;

  void showDashboardData(BuildContext context) async {
    _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection) {
      getAllInfo(context);
      getAllAuction(context);
    } else {
      Navigator.pushReplacementNamed(context, Routes.noInternet);
    }
  }

  Future getAllInfo(BuildContext context) async {
    InfoModel? response = await InfoService.getAllInfo();
    bannerCards = [];
    for (Values element in response!.values) {
      // ignore: use_build_context_synchronously
      bannerCards.add(bannerCard(context, element));
    }
    isBannerLoading = true;
    notifyListeners();
  }

  Future getAllAuction(BuildContext context) async {
    _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection) {
      AuctionModels? model = await AuctionServices.getAllAuctions();
      auctionCards = [];
      for (AuctionValues element in model!.values) {
        // ignore: use_build_context_synchronously
        auctionCards.add(actionCards(context, element));
      }
      isAuctionLoading = true;
    } else {
      Navigator.pushReplacementNamed(context, Routes.noInternet);
    }
    notifyListeners();
  }
}
