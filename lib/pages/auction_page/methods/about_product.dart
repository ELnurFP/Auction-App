import 'package:flutter/material.dart';

import '../../../utils/size.dart';
import 'detail_card.dart';

Expanded aboutProductWidget(BuildContext context, List catagoryName) {
  return Expanded(
    child: ListView.separated(
      itemBuilder: ((context, index) =>
          detailCard(context, catagoryName[index])),
      separatorBuilder: (_, index) => Column(
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
      ),
      itemCount: catagoryName.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
    ),
  );
}
