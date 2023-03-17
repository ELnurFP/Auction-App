import 'package:flutter/material.dart';

import '../../../../providers/auction_provider.dart';
import '../../../../utils/color.dart';
import '../../../../utils/size.dart';

Container realAuctionHeader(BuildContext context, AuctionProvider state) {
  return Container(
    height: getHeight(130, context),
    width: getWidth(350, context),
    padding: EdgeInsets.symmetric(
        horizontal: getWidth(15, context), vertical: getHeight(18, context)),
    decoration: BoxDecoration(
      color: kDoneColor2,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Birka No',
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            state.birkaNo!,
            style: TextStyle(color: kPrimaryColor),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Başlanğıc məbləği',
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            '${state.startPrice} AZN',
            style: const TextStyle(color: kPrimaryColor),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Son məbləğ',
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            '${state.totalAmount} AZN',
            style: const TextStyle(color: kPrimaryColor),
          ),
        ]),
      ],
    ),
  );
}
