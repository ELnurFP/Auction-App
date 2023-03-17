import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/providers/text_field_validator_provider.dart';

import '../../providers/global_provider.dart';
import '../../utils/routes.dart';
import '../../utils/size.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController fin = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextFieldValidation(),
      child: Consumer<TextFieldValidation>(builder: (context, state, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Xoş Gəlmişsiniz!',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: Colors.black),
            ),
          ),
          body: SizedBox(
            height: getHeight(812, context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          'Qeydiyyatdan keçin.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(144, 152, 177, 1),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(40, context),
                      ),
                      customTextField(context, 'FIN kod', fin, false),
                      SizedBox(
                        height: getHeight(16, context),
                      ),
                      customTextField(
                          context, 'Mobil nömrə', phoneNumber, true),
                      SizedBox(
                        height: getHeight(40, context),
                      ),
                      customButton(context, () async {
                        await context.read<GlobalProvider>().checkInternet();
                        context.read<GlobalProvider>().hasConnection
                            ? state.submitData(context)
                            : Navigator.pushReplacementNamed(
                                context, Routes.noInternet);
                      }),
                      SizedBox(
                        height: getHeight(100, context),
                      ),
                      RichText(
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Siz qeydiyyatdan keçərək',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nİstifadə Şərtləri və Qaydaları',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' qəbul\nedəcəksiniz.!'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? Image.asset(
                        'assets/images/city.png',
                        width: getWidth(375, context),
                        fit: BoxFit.fill,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
