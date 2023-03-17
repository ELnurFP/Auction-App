import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dashboard_provider.dart';
import '../../utils/size.dart';

class AuctionPage extends StatelessWidget {
  const AuctionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider()..getAllAuction(context),
      child: Consumer<DashboardProvider>(builder: (context, state, child) {
        return state.isAuctionLoading == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  title: const Text('Auksionlar',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
                body: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding:
                      EdgeInsets.symmetric(horizontal: getWidth(10, context)),
                  itemBuilder: ((context, index) {
                    return state.auctionCards[index];
                  }),
                  separatorBuilder: (context, index) => SizedBox(
                    height: getHeight(1, context),
                  ),
                  itemCount: state.auctionCards.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                ),
              );
      }),
    );
  }
}
