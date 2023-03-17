import 'package:flutter/material.dart';
import '../../utils/size.dart';

class LiveStocksPage extends StatelessWidget {
  const LiveStocksPage({Key? key, required this.name, required this.liveStocks})
      : super(key: key);
  final String name;
  final List<Widget> liveStocks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: getWidth(10, context)),
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) => liveStocks[index]),
        separatorBuilder: (context, index) => SizedBox(
          height: getHeight(2, context),
        ),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: liveStocks.length,
      ),
    );
  }
}
