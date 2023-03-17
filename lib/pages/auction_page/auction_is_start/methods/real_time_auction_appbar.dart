import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../providers/auction_provider.dart';

AppBar realTimeAuctionAppBar(BuildContext context, AuctionProvider state) {
  return AppBar(
    title: Text(
      '${state.lotName} Auksion',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        state.disconnectSignalR();
        Navigator.pop(context);
      },
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/i.svg'),
      ),
    ],
  );
}
