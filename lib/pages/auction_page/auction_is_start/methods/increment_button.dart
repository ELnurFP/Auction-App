import 'package:flutter/material.dart';

import '../../../../providers/auction_provider.dart';

ElevatedButton increment(AuctionProvider value, int num) {
  return ElevatedButton(
      onPressed: () {
        value.editBidController(num);
        value.onCheck();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF2F2F2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0),
      child: Text(
        '+$num AZN',
        style: const TextStyle(color: Color(0xff8F8D8D)),
      ));
}
