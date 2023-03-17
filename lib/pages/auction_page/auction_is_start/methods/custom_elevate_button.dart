import 'package:flutter/material.dart';

import '../../../../providers/auction_provider.dart';
import '../../../../utils/color.dart';
import '../../../../utils/size.dart';

SizedBox customElevatedButton(BuildContext context, AuctionProvider value) {
  return SizedBox(
    width: getWidth(160, context),
    height: getHeight(55, context),
    child: ElevatedButton(
      onPressed: () {
        if (!value.sendBtnClrBln ||
            int.parse(value.bidController.value.text) < 5) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text(
                      'Məbləğ boşdur və ya 5 azn-dən kiçikdir',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text(
                      'Məbləği daxil edin!',
                      textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Bağla',
                            )),
                      ),
                    ],
                  ));
          return;
        }
        value.sendBid(int.parse(value.bidController.value.text));
        value.clearBidController();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor:
              value.sendBtnClrBln ? kDoneColor : const Color(0xffF2F2F2),
          splashFactory: NoSplash.splashFactory,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0),
      child: Text(
        'Göndər',
        style: TextStyle(
            color: value.sendBtnClrBln ? Colors.white : const Color(0xff8F8D8D),
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}
