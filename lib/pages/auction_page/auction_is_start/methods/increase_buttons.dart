import 'package:flutter/material.dart';

import '../../../../providers/auction_provider.dart';
import '../../../../utils/size.dart';
import 'increment_button.dart';

SingleChildScrollView increaseButtons(
    BuildContext context, AuctionProvider value) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: SizedBox(
      width: getWidth(360, context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          increment(value, 10),
          increment(value, 20),
          increment(value, 30),
          increment(value, 40),
        ],
      ),
    ),
  );
}
