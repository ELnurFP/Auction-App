import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/providers/history_provider.dart';

import '../../utils/size.dart';
import 'history_tabbar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryProvider()..getAllLHistories(context),
      child: Consumer<HistoryProvider>(builder: (context, state, child) {
        return state.loading
            ? Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: const Text(
                    'Tarixçə',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                ),
                body: Column(
                  children: <Widget>[
                    historyTabBar(context, state),
                    const SizedBox(
                      height: 15,
                    ),
                    state.historyCard.isNotEmpty
                        ? ListView.separated(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(10, context)),
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return state.historyCard[index];
                            }),
                            separatorBuilder: (context, index) => SizedBox(
                              height: getHeight(2, context),
                            ),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.historyCard.length,
                          )
                        : Center(
                            child: Text(
                            'Tarixçə boşdur',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
