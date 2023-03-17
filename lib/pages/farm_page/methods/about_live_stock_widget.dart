import 'package:flutter/material.dart';

import '../../../models/farm_model/live_stock_model.dart';
import '../../../utils/size.dart';
import 'live_stock_card.dart';

Expanded aboutLiveStockWidget(
    BuildContext context, LiveStockDetailed liveStockDetailed) {
  List<String> keys = [];
  List<String> values = [];
  for (var entry in liveStockDetailed.toJson().entries) {
    keys.add(entry.key);
    values.add(entry.value.toString());
  }
  Column seperate() {
    return Column(
      children: [
        SizedBox(
          height: getHeight(15, context),
        ),
        Container(
          width: double.infinity,
          height: getHeight(1, context),
          color: const Color(0xffF5F6FA),
        ),
      ],
    );
  }

  return Expanded(
      child: ListView(
    children: [
      liveStockCard(context, "Cins", liveStockDetailed.breedName.toString()),
      seperate(),
      liveStockCard(
          context, "Mənşə ölkəsi", liveStockDetailed.country.toString()),
      seperate(),
      liveStockCard(context, "Birka No", liveStockDetailed.id.toString()),
      seperate(),
      liveStockCard(
          context, "Vaksinlər", liveStockDetailed.vactinations[0].toString()),
      seperate(),
      liveStockCard(
          context, "Erkək/Dişi", liveStockDetailed.sex == 1 ? 'Erkək' : 'Dişi'),
      seperate(),
      liveStockCard(
          context, "Diri çəkisi", liveStockDetailed.weight.toString()),
      seperate(),
      liveStockCard(context, "Süd məhsuldarlığı",
          liveStockDetailed.milkYieald.toString()),
      seperate(),
    ],
  )

      // ListView.separated(
      //   itemBuilder: ((context, index) =>
      //       liveStockCard(context, keys[index], values[index])),
      //   separatorBuilder: (_, index) => Column(
      //     children: [
      //       SizedBox(
      //         height: getHeight(15, context),
      //       ),
      //       Container(
      //         width: double.infinity,
      //         height: getHeight(1, context),
      //         color: const Color(0xffF5F6FA),
      //       ),
      //     ],
      //   ),
      //   itemCount: keys.length,
      //   shrinkWrap: true,
      //   physics: const BouncingScrollPhysics(),
      // ),
      );
}
