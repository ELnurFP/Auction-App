import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/global_provider.dart';
import '../../utils/size.dart';
import '../widgets/custom_status_button.dart';
import 'methods/auction_date.dart';

class AuctionDetail extends StatelessWidget {
  const AuctionDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    //  print('${arguments['date']}, ${arguments['adde']}');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text(arguments["name"],
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      body: Consumer<GlobalProvider>(builder: (context, state, child) {
        return state.loading == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(15, context),
                    vertical: getHeight(15, context)),
                child: Column(
                  children: <Widget>[
                    //              'startTime': value.startTime,
                    // 'address': value.address,
                    actionDate(
                        context, arguments['startTime'], arguments['address']),
                    SizedBox(
                      height: getHeight(15, context),
                    ),
                    //   auctionTabBar(context, tabBar),
                    SizedBox(
                      height: getHeight(15, context),
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return state.lotsCard[index];
                        }),
                        separatorBuilder: (context, index) => SizedBox(
                          height: getHeight(2, context),
                        ),
                        itemCount: state.lotsCard.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ),

                    customStatusButton(context, state.status, arguments['id']),
                  ],
                ),
              );
      }),
    );
  }
}
