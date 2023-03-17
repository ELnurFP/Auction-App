import 'package:flutter/material.dart';
import '../../../utils/size.dart';
import 'about_product.dart';
import 'image_slader.dart';
import 'start_price.dart';

class LotDetailPage extends StatelessWidget {
  LotDetailPage({super.key});
  final List<String> catagoryName = [
    'Cins',
    'Əsas istiqaməti',
    'Mənşə ölkəsi',
    'Birka No',
    'Vaksinlər',
    'Erkək/Dişi',
    'Boğazlıq vəziyyəti',
    'Diri çəkisi',
    'Süd məhsuldarlığı'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Lot 1',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(15, context),
            vertical: getHeight(15, context)),
        child: Column(
          children: [
            imageSlider(context, []),
            SizedBox(
              height: getHeight(15, context),
            ),
            startPrice(context),
            SizedBox(
              height: getHeight(15, context),
            ),
            aboutProductWidget(context, catagoryName),
            SizedBox(
              height: getHeight(15, context),
            )
          ],
        ),
      ),
    );
  }
}
