import 'package:flutter/material.dart';

import '../../providers/history_provider.dart';
import '../../utils/size.dart';

SizedBox historyTabBar(BuildContext context, HistoryProvider tabBar) {
  return SizedBox(
    height: getHeight(45, context),
    child: ListView.builder(
        padding: EdgeInsets.only(left: getWidth(16, context)),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                tabBar.changeTabIndex(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: tabBar.tabIndex == index
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
                    tabBar.tabBarItems[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: tabBar.tabIndex == index
                            ? const Color(0xff3E8954)
                            : const Color(0xff8F8D8D),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        itemCount: tabBar.tabBarItems.length),
  );
}
