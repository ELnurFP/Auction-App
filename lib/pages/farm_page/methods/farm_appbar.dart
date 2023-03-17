import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../models/farm_model/farm_model.dart';
import '../../../providers/farm_provider.dart';
import '../../../utils/size.dart';

AppBar farmAppBar(BuildContext context) {
  var farm = context.watch<FarmProvider>();
  Container textEditing() {
    return Container(
      width: getWidth(300, context),
      padding: EdgeInsets.symmetric(vertical: getWidth(10, context)),
      height: getHeight(60, context),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: farm.controller,
        onChanged: (e) {
          farm.getAllFarms(
              context,
              FarmPostModel(
                  searchString: farm.controller.text,
                  mainPurpouse: farm.farmTabIndex == 0
                      ? ''
                      : farm.farmTabbarItems[farm.farmTabIndex]));
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0,
            ),
          ),
          counter: const Offstage(),
          hintText: 'axtar',
          hintStyle: const TextStyle(
              color: Color.fromRGBO(144, 152, 177, 1),
              fontFamily: 'Poppins',
              fontSize: 14,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
      ),
    );
  }

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: AnimatedCrossFade(
        firstChild: const Text(
          'Təsərrüfatlar',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
        secondChild: Center(child: textEditing()),
        crossFadeState: farm.openSearch
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300)),
    actions: [
      GestureDetector(
        onTap: () {
          farm.changeAppBarStatus();
        },
        child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.black,
            )),
      )
    ],
  );
}
