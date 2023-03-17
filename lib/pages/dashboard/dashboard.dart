import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/providers/dashboard_provider.dart';
import '../../providers/global_provider.dart';
import '../../utils/size.dart';
import 'methods/auction_titles.dart';
import 'methods/dashboard_title.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider()..showDashboardData(context),
      child: Consumer<DashboardProvider>(builder: (context, state, child) {
        return Scaffold(
          body: Container(
            height: getHeight(812, context),
            width: getWidth(375, context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xffB7D8A6),
                  (Colors.grey[50])!,
                ],
                stops: const [0, 0.5],
              ),
            ),
            child: Column(
              children: [
                dashboarTitle(() {
                  
                }, context),
                SizedBox(
                  height: getHeight(30, context),
                ),
                SizedBox(
                  height: getHeight(250, context),
                  width: getWidth(375, context),
                  child: state.isBannerLoading == false
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.only(left: 20),
                          itemBuilder: (context, index) {
                            return state.bannerCards[index];
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: getWidth(16, context),
                            );
                          },
                          itemCount: state.bannerCards.length,
                          scrollDirection: Axis.horizontal,
                        ),
                ),
                SizedBox(
                  height: getHeight(24, context),
                ),
                auctionsTitle(context, () {
                  context.read<GlobalProvider>().changeIndex(1);
                }),
                Expanded(
                  child: state.isAuctionLoading == false
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemBuilder: ((context, index) {
                            return state.auctionCards[index];
                          }),
                          separatorBuilder: (context, index) => const SizedBox(
                              //  height: getHeight(10, context),
                              ),
                          itemCount: state.auctionCards.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                        ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
