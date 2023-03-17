import 'package:flutter/material.dart';

import '../../../../models/joiner_model/joiner_model.dart';
import '../../../../utils/color.dart';
import '../../../../utils/size.dart';

Card joinersCard(BuildContext context, JoinerModel joinerModel) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(20, context), vertical: getHeight(10, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(joinerModel.userName!,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Column(
            children: [
              Text(
                '${joinerModel.realAmount} AZN',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '(+${joinerModel.amount} AZN)',
                style: const TextStyle(
                    fontSize: 10,
                    color: kDoneColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    ),
  );
}
