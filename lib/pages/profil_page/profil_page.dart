import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/providers/profile_provider.dart';
import 'package:qobustan/utils/routes.dart';

import '../../utils/size.dart';
import '../dashboard/methods/info_detail.dart';
import 'widget/custom_settings_card.dart';
import 'widget/personal_details.dart';
import 'widget/privacy_page.dart';
import 'widget/profil_page_info.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider()..getProfileInfo(context),
      child: Consumer<ProfileProvider>(builder: (context, state, child) {
        return state.loading == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: const Text(
                    'Profil',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    profilPageInfoWidget(
                        context,
                        state.profileModel!.fullName,
                        state.remove994(state.profileModel!.phoneNumber),
                        state.bytes),
                    const Divider(
                      height: 1,
                      color: Color(0xffDDDDDD),
                    ),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    customSettingsCard(context, 'Şəxsi məlumatlar', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalDetails(
                                  name: state.profileModel!.fullName,
                                  number: state.remove994(
                                      state.profileModel!.phoneNumber))));
                    }),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    const Divider(height: 2, color: Color(0xffDDDDDD)),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    customSettingsCard(context, 'Gizlilik siyasəti', () async {
                      final data = await state.getInfo('privacy');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileInfoPage(
                                  data: data.toString(),
                                  name: 'Gizlilik siyasəti')));
                    }),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    const Divider(height: 1, color: Color(0xffDDDDDD)),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    customSettingsCard(context, 'Haqqımızda', () {
                      return;
                    }),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    const Divider(height: 1, color: Color(0xffDDDDDD)),
                    SizedBox(
                      height: getHeight(16, context),
                    ),
                    TextButton(
                        onPressed: () {
                          GetStorage().remove('token');
                          Navigator.pushReplacementNamed(context, Routes.login);
                        },
                        child: const Text(
                          'Çıxış',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 1),
                        )),
                  ],
                ),
              );
      }),
    );
  }
}
