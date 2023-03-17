import 'package:flutter/material.dart';

import '../../models/farm_model/live_stock_model.dart';
import '../../utils/size.dart';
import '../auction_page/methods/image_slader.dart';
import 'methods/about_live_stock_widget.dart';

class LiveStockDetailPage extends StatelessWidget {
  const LiveStockDetailPage({super.key, this.liveStockDetailed});
  final LiveStockDetailed? liveStockDetailed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(liveStockDetailed!.name!,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(15, context),
            vertical: getHeight(15, context)),
        child: Column(
          children: [
            imageSlider(context, liveStockDetailed!.images),
            SizedBox(
              height: getHeight(15, context),
            ),
            SizedBox(
              height: getHeight(15, context),
            ),
            aboutLiveStockWidget(context, liveStockDetailed!),
            SizedBox(
              height: getHeight(15, context),
            )
          ],
        ),
      ),
    );
  }
}
