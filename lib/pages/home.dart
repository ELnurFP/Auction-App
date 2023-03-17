import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/global_provider.dart';
import '../utils/color.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(builder: (context, tab, child) {
      return Scaffold(
        key: scaffoldKey,
        body: tab.getTab(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: (Colors.grey[50])!,
          selectedLabelStyle: const TextStyle(fontSize: 8),
          fixedColor: kPrimaryColor,
          unselectedLabelStyle: const TextStyle(fontSize: 8),
          type: BottomNavigationBarType.fixed,
          currentIndex: tab.index,
          onTap: (value) {
            tab.changeIndex(value);
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/home.svg',
                    color: kPrimaryColor),
                icon: SvgPicture.asset('assets/icons/home.svg',
                    color: Colors.grey),
                label: 'Ana səhifə'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/auction.svg',
                    color: kPrimaryColor),
                icon: SvgPicture.asset('assets/icons/auction.svg',
                    color: Colors.grey),
                label: 'Auksionlar'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/farm.svg',
                    color: kPrimaryColor),
                icon: SvgPicture.asset('assets/icons/farm.svg',
                    color: Colors.grey),
                label: 'Təsərrüfatlar'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/clock.svg',
                    color: kPrimaryColor),
                icon: SvgPicture.asset('assets/icons/clock.svg',
                    color: Colors.grey),
                label: 'Tarixçə'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/profile.svg',
                    color: kPrimaryColor),
                icon: SvgPicture.asset('assets/icons/profile.svg',
                    color: Colors.grey),
                label: 'Hesab'),
          ],
        ),
      );
    });
  }
}
