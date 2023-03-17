import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/global_provider.dart';
import '../../utils/size.dart';

Consumer<GlobalProvider> customStatusButton(
    BuildContext context, String text, String id) {
  return Consumer<GlobalProvider>(builder: (context, state, child) {
    return GestureDetector(
      onTap: () {
        text == 'Müraciət et'
            ? state.joinAuction(context, id)
            : text == 'Qəbul edildi'
                ? state.startAuction(context, id)
                : null;
      },
      child: Container(
        width: double.infinity,
        height: getHeight(60, context),
        decoration: BoxDecoration(
          color: state.statusButtonColor(text),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: state.auctionloading == true
              ? Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  });
}
