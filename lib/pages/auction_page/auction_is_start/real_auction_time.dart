import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../providers/auction_provider.dart';
import '../../../utils/size.dart';
import 'methods/bid_end_time.dart';
import 'methods/custom_elevate_button.dart';
import 'methods/increase_buttons.dart';
import 'methods/real_auction_header.dart';
import 'methods/real_time_auction_appbar.dart';

class RealTimeAuction extends StatelessWidget {
  const RealTimeAuction({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return ChangeNotifierProvider(
      create: (_) =>
          AuctionProvider()..initSignalR(context, arguments['lotsCount']),
      child: Consumer<AuctionProvider>(
        builder: ((context, state, child) {
          return Scaffold(
            appBar: realTimeAuctionAppBar(context, state),
            body: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(20, context),
                  vertical: getHeight(10, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  realAuctionHeader(context, state),
                  SizedBox(
                    height: getHeight(10, context),
                  ),
                  const Text('Auksiona qoşulanlar',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: getHeight(10, context),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: state.joinersCards,
                    ),
                  ),
                  bidEndTime(context, state.showLastTime),
                  SizedBox(
                    height: getHeight(10, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getWidth(160, context),
                        height: getHeight(55, context),
                        child: TextFormField(
                          onChanged: (price) {
                            state.onCheck();
                          },
                          controller: state.bidController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Məbləği daxil edin',
                            hintStyle: TextStyle(
                              color: Color(0xFF8F8D8D),
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFFB6D7A5),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Color(0xFFB6D7A5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      customElevatedButton(context, state)
                    ],
                  ),
                  SizedBox(
                    height: getHeight(10, context),
                  ),
                  increaseButtons(context, state),
                  SizedBox(
                    height: getHeight(10, context),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
