import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/pages/profil_page/widget/phone_card.dart';

import '../../../providers/profile_provider.dart';
import '../../../utils/size.dart';
import 'personal_detail_card.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key, required this.name, required this.number})
      : super(key: key);
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneEditProvider(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Personal Details',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 16,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(getWidth(20, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '  Ad, Soyad',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(18, 22, 36, 1),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(
                height: getHeight(7, context),
              ),
              personalDetailCard(context, name),
              SizedBox(
                height: getHeight(15, context),
              ),
              const Text(
                '  Əlaqə Nömrəsi',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(18, 22, 36, 1),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(
                height: getHeight(7, context),
              ),

              phoneCard(context, '+994 $number'),

              SizedBox(
                height: getHeight(15, context),
              ),
              // const Text(
              //   '  Email Adresi',
              //   textAlign: TextAlign.left,
              //   style: TextStyle(
              //       color: Color.fromRGBO(18, 22, 36, 1),
              //       fontFamily: 'Poppins',
              //       fontSize: 14,
              //       letterSpacing: 0,
              //       fontWeight: FontWeight.normal,
              //       height: 1),
              // ),
              // SizedBox(
              //   height: getHeight(7, context),
              // ),
              // personalDetailCard(context, 'gemmamelton@gmail.com'),
            ],
          ),
        ),
      ),
    );
  }
}
