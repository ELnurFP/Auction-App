import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qobustan/config/configs.dart';

import '../../../utils/size.dart';
import '../../models/histories_model/histories_models.dart';

GestureDetector historyItem(
    BuildContext context, HistoryValues value, GestureTapCallback onTap) {
  Widget? icon() {
    switch (value.lastStatus) {
      case 1:
        return SvgPicture.asset(
          'assets/icons/wait.svg',
          color: const Color(0xffFFC240),
        );
      case 2:
        return SvgPicture.asset(
          'assets/icons/done.svg',
        );
      case 3:
        return SvgPicture.asset('assets/icons/reject.svg');
      default:
        return const Icon(Icons.do_not_disturb_alt);
    }
  }

  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(
          value.lotName!,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "${value.time!.hour}:${value.time!.minute} ${value.time!.day}.${value.time!.month}.${value.time!.year}",
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
                "${Configs.baseURL}/${value.livestockImage!}",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
    
        trailing: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(10, context),
                vertical: getHeight(8, context)),
            child: icon()),
      ),
    ),
  );
}
