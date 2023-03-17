import 'package:flutter/material.dart';
import 'package:qobustan/config/configs.dart';

import '../../../models/auksion_model/auction_model.dart';
import '../../../utils/size.dart';

GestureDetector lotCard(
    BuildContext context, Lots lots, GestureTapCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(
          lots.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "Birka No: ${lots.livestockId}",
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
                "${Configs.baseURL}/${lots.imageUrl}",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Text(
          "${lots.startPrice} AZN",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
