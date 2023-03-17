import 'package:flutter/material.dart';
import 'package:qobustan/config/configs.dart';

import '../../../models/info_model/info_model.dart';
import 'cow_image.dart';
import 'info_detail.dart';

GestureDetector bannerCard(BuildContext context, Values value) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfoPage(
                    value: value,
                  )));
    },
    child: cowImage(
        context, value.title, "${Configs.baseURL}/${value.bannerImageUrl}"),
  );
}
