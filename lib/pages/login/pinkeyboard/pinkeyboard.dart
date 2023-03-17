import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/pageview_provider.dart';
import '../../../utils/size.dart';
import 'buttons.dart';

Row pinKeyboard(BuildContext context, TextEditingController pin) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pinButtons(context, '1'),
          pinButtons(context, '4'),
          pinButtons(context, '7'),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pinButtons(context, '2'),
          pinButtons(context, '5'),
          pinButtons(context, '8'),
          pinButtons(context, '0'),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pinButtons(context, '3'),
          pinButtons(context, '6'),
          pinButtons(context, '9'),
          Container(
            width: getWidth(90, context),
            height: getWidth(80, context),
            margin: EdgeInsets.only(bottom: getWidth(15, context)),
            child: IconButton(
                onPressed: () {
                  pin.text.isNotEmpty
                      ? context.read<PincodeProvider>().deteleSymbol()
                      : null;
                },
                icon: Icon(
                  Icons.backspace_outlined,
                  color: const Color(0xffC1C1C6),
                  size: getWidth(18, context),
                )),
          ),
        ],
      ),
    ],
  );
}
