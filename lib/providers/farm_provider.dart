import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../config/configs.dart';
import '../models/farm_model/farm_model.dart';
import '../models/farm_model/live_stock_model.dart';
import '../pages/farm_page/live_stock_detailed_page.dart';
import '../pages/farm_page/live_stock_page.dart';
import '../pages/farm_page/methods/farm_card.dart';
import '../services/remote/farm_services.dart';
import '../utils/routes.dart';

class FarmProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  List farmTabbarItems = [];
  List<Widget> farms = [];
  int _farmTabIndex = 0;
  int get farmTabIndex => _farmTabIndex;
  bool openSearch = false;
  late BuildContext _buildContext;
  bool loading = false;
  bool _hasConnection = false;
  bool get hasConnection => _hasConnection;
  void changeFarmTabIndex(int value) {
    _farmTabIndex = value;
    getAllFarms(
        _buildContext,
        FarmPostModel(
          mainPurpouse: value == 0 ? '' : farmTabbarItems[value],
        ));
    notifyListeners();
  }

  getFarmPurpose(BuildContext context) async {
    _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection) {
      farmTabbarItems = [];
      List<dynamic> purposes = await FarmService.getFarmPurpose();
      purposes.add("Bütün");
      farmTabbarItems = purposes.reversed.toList();
    } else {
      Navigator.pushReplacementNamed(context, Routes.noInternet);
    }
    notifyListeners();
  }

  getAllFarms(BuildContext context, FarmPostModel postModel) async {
    farms = [];
    _buildContext = context;
    FarmModels? farmModel = await FarmService.getAllFarms(postModel);
    for (FarmValues element in farmModel!.values) {
      // ignore: use_build_context_synchronously
      farms.add(farmCard(_buildContext, "${Configs.baseURL}/${element.image}",
          element.name!, element.address!, () {
        getAllLiveStocks(element.id!, element.name!);
      }));
    }
    loading = true;
    notifyListeners();
  }

  changeAppBarStatus() {
    openSearch = !openSearch;
    notifyListeners();
  }

  getAllLiveStocks(String id, String name) async {
    List<Widget> liveStocks = [];
    LiveStockModels? liveStockModels = await FarmService.getAllLiveStock(id);

    for (LiveStockValues? element in liveStockModels!.values) {
      // ignore: use_build_context_synchronously
      liveStocks.add(farmCard(_buildContext,
          "${Configs.baseURL}/${element?.imageUrl}", element!.name!, '', () {
        getDetailedLiveStock(element.id!);
      }));
    }
    // ignore: use_build_context_synchronously
    Navigator.push(
      _buildContext,
      MaterialPageRoute(
          builder: (context) => LiveStocksPage(
                name: name,
                liveStocks: liveStocks,
              )),
    );
  }

  getDetailedLiveStock(String id) async {
    LiveStockDetailed? liveStockDetailed =
        await FarmService.detailedLiveStock(id);
    // ignore: use_build_context_synchronously
    Navigator.push(
      _buildContext,
      MaterialPageRoute(
          builder: (context) => LiveStockDetailPage(
                liveStockDetailed: liveStockDetailed,
              )),
    );
  }
}
