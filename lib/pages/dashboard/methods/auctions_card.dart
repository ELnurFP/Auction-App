import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/configs.dart';
import '../../../models/auksion_model/auction_model.dart';
import '../../../providers/global_provider.dart';
import '../../../utils/color.dart';
import '../../../utils/routes.dart';
import '../../../utils/size.dart';

GestureDetector actionCards(BuildContext context, AuctionValues value) {
  return GestureDetector(
    onTap: () {
      //   print('${value.startTime}  ${value.address} values');
      context.read<GlobalProvider>().getUserStatus(context, value.id!);
      context.read<GlobalProvider>().getAllLots(value.id.toString(), context);
      print('${value.address} adress, ${value.startTime} startTime');
      Navigator.pushNamed(context, Routes.auctionDetailed, arguments: {
        'name': value.name,
        'id': value.id,
        'startTime': value.startTime,
        'address': value.address,
        'count': context.read<GlobalProvider>().lotsCount
      });
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(
          value.name!,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          value.address!,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        leading: Container(
          width: getWidth(50, context),
          height: getWidth(50, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                "${Configs.baseURL}/${value.imageUrl}",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(10, context),
              vertical: getHeight(8, context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: kDoneColor2,
          ),
          child: Text(
            "${value.startTime!.hour}:${value.startTime!.minute.toString().padLeft(2, '0')}-${value.startTime!.day}:${value.startTime!.month}:${value.startTime!.year}",
            style: const TextStyle(fontSize: 10, color: kPrimaryColor),
          ),
        ),
      ),
    ),
  );
}
