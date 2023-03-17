import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/pageview_provider.dart';
import '../../../utils/size.dart';

Consumer<PincodeProvider> pinButtons(BuildContext context, String text) {
  return Consumer<PincodeProvider>(builder: (context, state, child) {
    return GestureDetector(
      onTap: () {
        state.editPincodeController(text);
      },
      child: Container(
        width: getWidth(75, context),
        height: getWidth(65, context),
        //    padding: EdgeInsets.all(getWidth(20, context)),
        margin: EdgeInsets.all(getWidth(6, context)),
        decoration: BoxDecoration(
            color: const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  });
}
