import 'package:flutter/material.dart';

import '../../config/configs.dart';
import '../../models/histories_model/histories_models.dart';
import '../../utils/size.dart';

class HistoryDetailedPage extends StatelessWidget {
  const HistoryDetailedPage({Key? key, this.historyDeteailed, this.name})
      : super(key: key);
  final HistoryDeteailed? historyDeteailed;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          name!,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Birka NO: ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  historyDeteailed!.liveStockId!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Son Məbləğ: ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  historyDeteailed!.finalAmount!.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: getHeight(200, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "${Configs.baseURL}/${historyDeteailed!.image!}"),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Son Status',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: ((context, index) => ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: historyDeteailed!.history[index].type == 5
                                  ? Colors.red
                                  : historyDeteailed!.history[index].type == 4
                                      ? Colors.green
                                      : Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          width: 2,
                          height: 20,
                          color: const Color(0xffB6D7A5).withOpacity(.2),
                        )
                      ],
                    ),
                    title: Text(
                      historyDeteailed!.history[index].description!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                        "${historyDeteailed!.history[index].time!.day}:${historyDeteailed!.history[index].time!.month}:${historyDeteailed!.history[index].time!.year} / ${historyDeteailed!.history[index].time!.hour.toString().padLeft(2, '0')}:${historyDeteailed!.history[index].time!.minute}"),
                  )),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: historyDeteailed!.history.length,
            ))
          ],
        ),
      ),
    );
  }
}
