import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:signalr_core/signalr_core.dart';

import '../config/configs.dart';
import '../models/auksion_model/auction_model.dart';
import '../models/joiner_model/joiner_model.dart';
import '../pages/auction_page/auction_is_start/methods/joiners_card.dart';
import '../pages/auction_page/methods/winner_dialog.dart';

class AuctionProvider extends ChangeNotifier {
  final TextEditingController bidController = TextEditingController();
  late HubConnection hubConnection;
  List binds = [];
  List<Widget> joinersCards = [];
  String joinerName = '';
  int totalAmount = 0;
  int startPrice = 0;
  int startTimeSeconds = 0;
  bool sendBtnClrBln = false;
  String showLastTime = '';
  Duration duration = const Duration();
  Timer? timer;
  String? lotName = '';
  String? birkaNo = '';
  int currectLot = 0;
  void countDown() {
    final seconds = duration.inSeconds - 1;
    duration = Duration(seconds: seconds);
    if (duration.inSeconds <= 0) timer?.cancel();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutesFowShow = twoDigits(duration.inMinutes.remainder(60));
    final secondsForShow = twoDigits(duration.inSeconds.remainder(60));
    showLastTime = '$minutesFowShow:$secondsForShow';
    notifyListeners();
  }

  void startTimer() {
    timer?.cancel();
    duration = Duration(seconds: startTimeSeconds);
    timer = Timer.periodic(const Duration(seconds: 1), (_) => countDown());
  }

  void editBidController(int num) {
    int price;

    bidController.text != ''
        ? price = int.parse(bidController.text)
        : price = 0;
    bidController.text = (price + num).toString();
    notifyListeners();
  }

  onCheck() {
    sendBtnClrBln = bidController.text.isNotEmpty;
    notifyListeners();
  }

  clearBidController() {
    bidController.clear();
    sendBtnClrBln = bidController.text.isNotEmpty;
    notifyListeners();
  }

  void initSignalR(BuildContext context, int lots_count) async {
    hubConnection =
        HubConnectionBuilder().withUrl(Configs.serverURl, HttpConnectionOptions(
      // logging: (level, message) => print("$message logging"),
      accessTokenFactory: () async {
        return GetStorage().read('auctionToken');
      },
    )).build();
    hubConnection.onclose((error) => log('Connection close'));
    hubConnection.on("BidNotification", (message) {
      _handleNewBids(message!, context);
    });
    hubConnection.on("CurrentLot", (message) {
      _currentLot(message!, context);
    });
    hubConnection.on("CurrentLotTime", (message) {
      _countSeconds(message!);
    });
    hubConnection.on("WrongBid", (message) {
      _wrongBid(message!);
    });
    hubConnection.on("LotWinner", (message) {
      _lotWinner(message!, context, lots_count);
    });
    hubConnection.on("AuctionEnded", (message) {
      _auctionEnded(message!, context);
    });
    if (hubConnection.state == HubConnectionState.disconnected) {
      await hubConnection.start();
    }
    // if (hubConnection.state == HubConnectionState.connected) {
    //   await hubConnection.invoke("AddUserToGroup");
    // }
    startTimer();
    notifyListeners();
  }

  void disconnectSignalR() async {
    timer?.cancel();
    if (hubConnection.state == HubConnectionState.connected) {
      await hubConnection.stop();
    }
    notifyListeners();
  }

  _auctionEnded(List<dynamic> args, BuildContext context) {
    disconnectSignalR();
  }

  _lotWinner(List<dynamic> args, BuildContext context, int lots_count) {
    print("$args  lot winner");
    var payload = parseJwt(GetStorage().read('auctionToken'));
    print(payload['sub'][1]);
    currectLot++;
    print('${currectLot} current lot ${lots_count} current lot');
    if (args[0] == payload['sub'][1]) {
      dialogBuilder(context, true, "", currectLot == lots_count);
      return;
    }

    dialogBuilder(context, false, args[1], currectLot == lots_count);
  }

  _countSeconds(List<dynamic> args) {
    timer?.cancel();
    startTimeSeconds = args[0];
    duration = Duration(seconds: startTimeSeconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutesFowShow = twoDigits(duration.inMinutes.remainder(60));
    final secondsForShow = twoDigits(duration.inSeconds.remainder(60));
    showLastTime = '$minutesFowShow:$secondsForShow';
    notifyListeners();
  }

  _wrongBid(List<dynamic> args) {
    print("$args   wrongbid");
  }

  _handleNewBids(List<dynamic> args, BuildContext context) {
    binds = args[0].reversed.toList();
    totalAmount = int.parse(binds[0]['realAmount'].toString());
    fillJoinersCards(context);
    notifyListeners();
  }

  _currentLot(List<dynamic> args, BuildContext context) {
    CurrentLotModel model = CurrentLotModel.fromJson(args[0]);
    joinersCards = [];
    startPrice = int.parse(model.startPrice);
    lotName = model.name;
    birkaNo = model.livestockId;
    totalAmount = startPrice;
    notifyListeners();
  }

  fillJoinersCards(BuildContext context) {
    List<Widget> tempCards = [];
    for (var element in binds) {
      JoinerModel model = JoinerModel.fromJson(element);
      tempCards.add(joinersCard(context, model));
    }
    joinersCards = tempCards;
  }

  sendBid(int bid) async {
    if (hubConnection.state == HubConnectionState.connected) {
      await hubConnection.invoke("Bid", args: <dynamic>[bid]);
      startTimer();
      notifyListeners();
    }
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
