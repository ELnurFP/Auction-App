import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/farm_model/farm_model.dart';
import '../../providers/farm_provider.dart';
import '../../utils/size.dart';
import 'methods/farm_appbar.dart';
import 'methods/farm_tabbar.dart';

class FarmPage extends StatelessWidget {
  const FarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FarmProvider()
        ..getFarmPurpose(context)
        ..getAllFarms(
            context,
            FarmPostModel(
              mainPurpouse: '',
            )),
      child: Consumer<FarmProvider>(builder: (context, state, child) {
        return state.loading == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: farmAppBar(context),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      farmTabBar(context, state),
                      SizedBox(
                        height: getHeight(16, context),
                      ),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(10, context)),
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) => state.farms[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: getHeight(2, context),
                        ),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.farms.length,
                      ),
                    ],
                  ),
                ));
      }),
    );
  }
}
