// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qobustan/pages/widgets/waiting_page.dart';

import '../models/auksion_model/auction_model.dart';
import '../models/farm_model/live_stock_model.dart';
import '../pages/auction_page/auction_page.dart';
import '../pages/auction_page/methods/lot_cards.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/farm_page/farm_page.dart';
import '../pages/farm_page/live_stock_detailed_page.dart';
import '../pages/history_page/history_page.dart';
import '../pages/profil_page/profil_page.dart';
import '../pages/widgets/dialog_helper.dart';
import '../services/remote/auction_services.dart';
import '../services/remote/farm_services.dart';
import '../utils/color.dart';
import '../utils/routes.dart';

class GlobalProvider extends ChangeNotifier {
  var tabs = [
    const DashboardPage(),
    const AuctionPage(),
    const FarmPage(),
    const HistoryPage(),
    const AccountPage()
  ];
  StartAuctionModel? startModel;
  int _tabIndex = 0;
  final box = GetStorage();
  int get tabIndex => _tabIndex;

  void changeTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  getTab() => tabs[_index];

  int _index = 0;
  int get index => _index;
  int lotsCount = 0;
  void changeIndex(int value) {
    _index = value;
    notifyListeners();
  }

  List<Widget> lotsCard = [];
  getAllLots(String id, BuildContext context) async {
    loading = false;

    AuctionLotModel? model = await AuctionServices.getAllLots(id);

    lotsCard = [];
    lotsCount = model!.lots.length;
    for (Lots element in model.lots) {
      lotsCard.add(lotCard(context, element, () {
        getDetailedLiveStock(element.livestockId, context);
      }));
    }
    loading = true;

    notifyListeners();
  }

  getDetailedLiveStock(String id, BuildContext context) async {
    LiveStockDetailed? liveStockDetailed =
        await FarmService.detailedLiveStock(id);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LiveStockDetailPage(
                liveStockDetailed: liveStockDetailed,
              )),
    );
  }

  bool auctionloading = true;
  joinAuction(BuildContext context, String id) async {
    loading = false;
    auctionloading = false;

    var request = await AuctionServices.joinAuction(id);
    if (request) {
      getUserStatus(context, id);
    }

    auctionloading = true;
    loading = true;

    notifyListeners();
  }

  startAuction(BuildContext context, String id) async {
    loading = false;
    //  notifyListeners();
    auctionloading = false;
    print("$loading START AUCTION");
    box.remove('auctionToken');
    var request = await AuctionServices.startAuction(id);

    if (request is! String) {
      box.write('auctionToken', request.token);
      request.token == ''
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WaitingPage(
                        startModel: request,
                      )))
          : Navigator.pushNamed(context, Routes.realTimeAuction,
              arguments: {'lotsCount': lotsCount});
      auctionloading = true;
      print('loading ${auctionloading}');
      return;
    }
    auctionloading = true;
    print('loading ${auctionloading}');
    loading = true;
    DialogHelper.showToast(context, request);
    notifyListeners();
  }

// statuslar
  Color statusButtonColor(String value) {
    Color color;
    if (status == 'Müraciət et') return color = kPrimaryColor;
    if (status == 'Müraciət edildi') return color = kClockColor;
    if (status == 'Qəbul edildi') return color = kPrimaryColor;
    color = kLogOutColor;
    return color;
  }

  bool loading = false;
  String status = 'Müraciət et';
  getUserStatus(BuildContext context, String id) async {
    loading = false;
    auctionloading = false;
    status = await AuctionServices.getUserStatus(context, id);
    if (status == 'None') status = 'Müraciət et';
    if (status == 'Waiting') status = 'Müraciət edildi';
    if (status == 'Accept') status = 'Qəbul edildi';
    if (status == 'Reject') status = 'Imtina edildi';
    auctionloading = true;
    loading = true;
    notifyListeners();
  }

  // internet connection
  bool _hasConnection = false;
  bool get hasConnection => _hasConnection;
  Future<void> checkInternet() async {
    _hasConnection = await InternetConnectionChecker().hasConnection;

    notifyListeners();
  }
}
