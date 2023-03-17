import 'package:flutter/material.dart';

import '../../../providers/farm_provider.dart';
import '../../../utils/size.dart';

SizedBox farmTabBar(BuildContext context, FarmProvider tabbar) {
  return SizedBox(
    height: getHeight(45, context),
    //width: getWidth(345, context),
    child: ListView.builder(
        padding: EdgeInsets.only(left: getWidth(16, context)),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                tabbar.changeFarmTabIndex(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: tabbar.farmTabIndex == index
                        ? const Color(0xffDFF3E7)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(14, context),
                  // vertical: getWidth(0, context)
                ),
                margin: EdgeInsets.only(right: getWidth(10, context)),
                child: Tab(
                  child: Text(
                    tabbar.farmTabbarItems[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: tabbar.farmTabIndex == index
                            ? const Color(0xff3E8954)
                            : const Color(0xff8F8D8D),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        itemCount: tabbar.farmTabbarItems.length),
  );
}
