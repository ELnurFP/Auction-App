import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/histories_model/histories_models.dart';
import '../pages/history_page/history_detailed.dart';
import '../pages/history_page/history_item.dart';
import '../services/remote/history_services.dart';
import '../utils/routes.dart';

class HistoryProvider extends ChangeNotifier {
  bool loading = false;

  List tabBarItems = ["Bütün", "Qalib olduqlarım", "Məğlub olduqlarım"];
  int tabIndex = 0;
  bool _hasConnection = false;
  bool get hasConnection => _hasConnection;
  late BuildContext _context;
  List<Widget> historyCard = [];
  getAllLHistories(BuildContext context) async {
    print(GetStorage().read('token'));
    loading = false;
    _hasConnection = await InternetConnectionChecker().hasConnection;
    _context = context;
    if (_hasConnection) {
      HistoryModels? model = await HistoryServices.getAllHistory();
      //print(model!.values);
      historyCard = [];
      for (HistoryValues element in model!.values) {
        // ignore: use_build_context_synchronously
        historyCard.add(historyItem(context, element, () {
          // ignore: use_build_context_synchronously
          getAllLHistoryDetailed(element.lotId!, element.lotName!);
          return;
        }));
      }
    } else {
      Navigator.pushReplacementNamed(context, Routes.noInternet);
    }
    loading = true;
    notifyListeners();
  }

  getAllLHistoriesWin() async {
    loading = false;

    HistoryModels? model = await HistoryServices.getAllHistoryWin();
    historyCard = [];
    for (HistoryValues element in model!.values) {
      // ignore: use_build_context_synchronously
      historyCard.add(historyItem(_context, element, () {
        // ignore: use_build_context_synchronously
        getAllLHistoryDetailed(element.lotId!, element.lotName!);
        return;
      }));
    }
    loading = true;

    notifyListeners();
  }

  getAllLHistoriesLose() async {
    loading = false;

    HistoryModels? model = await HistoryServices.getAllHistoryLose();
    historyCard = [];
    for (HistoryValues element in model!.values) {
      // ignore: use_build_context_synchronously
      historyCard.add(historyItem(_context, element, () {
        // ignore: use_build_context_synchronously
        getAllLHistoryDetailed(element.lotId!, element.lotName!);
        return;
      }));
    }
    loading = true;

    notifyListeners();
  }

  getAllLHistoryDetailed(String id, String name) async {
    HistoryDeteailed? model = await HistoryServices.getAllHistoryDetailed(id);
    // ignore: use_build_context_synchronously
    Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (context) => HistoryDetailedPage(
                  historyDeteailed: model,
                  name: name,
                )));
  }

  void changeTabIndex(int value) {
    tabIndex = value;
    switch (value) {
      case 0:
        getAllLHistories(_context);
        break;
      case 1:
        getAllLHistoriesWin();
        break;
      case 2:
        getAllLHistoriesLose();
        break;
    }
    notifyListeners();
  }
}
