import 'package:flutter/material.dart';
import 'package:qobustan/models/info_model/info_model.dart';

import '../../../config/configs.dart';
import '../../../utils/size.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.value});

  final Values value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          value.title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: getWidth(375, context),
        height: getHeight(812, context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(15, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(15, context),
              ),
              Container(
                width: getWidth(345, context),
                height: getHeight(200, context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "${Configs.baseURL}/${value.bannerImageUrl}"),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: getHeight(15, context),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Lorem Ipsum',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: getHeight(getHeight(15, context), context),
                    ),
                    Text(value.description,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xff7B7B7B))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
