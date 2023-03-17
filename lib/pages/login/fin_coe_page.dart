import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../providers/global_provider.dart';
import '../../providers/pageview_provider.dart';
import '../../utils/color.dart';
import '../../utils/routes.dart';
import '../../utils/size.dart';
import 'pinkeyboard/pinkeyboard.dart';

class FinCodePage extends StatelessWidget {
  const FinCodePage(
      {Key? key,
      required this.token,
      required this.phoneNumber,
      required this.isUpdate})
      : super(key: key);

  final String token;
  final String phoneNumber;
  final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PincodeProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'OTP Təsdiqləmə',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ),
        body: Consumer<PincodeProvider>(builder: (context, state, child) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: getHeight(15, context),
              ),
              const Text(
                '6 rəqəmli kodu daxil edin',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(32, 32, 39, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1),
              ),
              SizedBox(
                height: getHeight(10, context),
              ),
              Text(
                'Nömrəyə göndərildi $phoneNumber',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color.fromRGBO(32, 32, 39, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: PinCodeTextField(
                  controller: state.pincodeController,
                  //     backgroundColor: Color(0xffB6D7A5),
                  cursorColor: Colors.black,
                  onCompleted: (v) {
                    context.read<GlobalProvider>().checkInternet();
                    context.read<GlobalProvider>().hasConnection
                        ? isUpdate
                            ? state.updatePhone(context, phoneNumber, v)
                            : state.sendPinCode(context, v, token)
                        : Navigator.pushReplacementNamed(
                            context, Routes.noInternet);
                  },
                  keyboardType: TextInputType.none,
                  autoFocus: true,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: kPrimaryColor,
                    inactiveColor: Colors.grey,
                    selectedColor: const Color(0xffB6D7A5),
                    inactiveFillColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: getHeight(60, context),
                    fieldWidth: getWidth(47, context),
                  ),
                  //errorAnimationController: errorController, // Pass it here
                  onChanged: (value) {},
                  appContext: context,
                ),
              ),
              TweenAnimationBuilder<Duration>(
                  duration: Duration(minutes: 3),
                  tween: Tween(begin: Duration(minutes: 3), end: Duration.zero),
                  onEnd: () {
                    state.changeTimeStatus();
                  },
                  builder:
                      (BuildContext context, Duration value, Widget? child) {
                    final minutes = value.inMinutes;
                    final seconds = value.inSeconds % 60;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: kPrimaryColor),
                      ),
                    );
                  }),
              state.timeIsEnd
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Kod gəlmədi?',
                          style: TextStyle(
                            color: Color(0xff79797D),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Yenidən göndər',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const Spacer(),
              Consumer<PincodeProvider>(builder: (context, state, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(30, context),
                      vertical: getHeight(10, context)),
                  child: pinKeyboard(context, state.pincodeController),
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
