// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/pages/widgets/custom_elevate_button.dart';

import '../../../providers/profile_provider.dart';
import '../../../services/remote/profile_service.dart';
import '../../../utils/size.dart';
import '../../login/fin_coe_page.dart';

Consumer<PhoneEditProvider> phoneCard(BuildContext context, String title) {
  return Consumer<PhoneEditProvider>(builder: (context, state, child) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCrossFade(
              firstChild: firstphoneChild(context, title),
              secondChild: secondPhoneChild(context, state),
              crossFadeState: state.isEdited
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 500),
            ),
            SizedBox(
              width: getWidth(40, context),
              child: IconButton(
                  onPressed: () {
                    state.changeEdit();
                  },
                  icon: SvgPicture.asset('assets/icons/edit.svg',
                      height: getHeight(40, context))),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        state.isEdited
            ? customElevateButton(context, () async {
                await ProfileService.sendUpdateNumberSms(context);
                state.phoneController.text.length == 9
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinCodePage(
                                  isUpdate: true,
                                  phoneNumber:
                                      '994${state.phoneController.text}',
                                  token: GetStorage().read('token'),
                                )))
                    : null;
              }, true, 'Yadda Saxla')
            : const SizedBox()
      ],
    );
  });
}

Container secondPhoneChild(BuildContext context, PhoneEditProvider state) {
  return Container(
      width: getWidth(295, context),
      height: getHeight(53, context),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      padding: EdgeInsets.only(
          left: getWidth(15, context), top: getHeight(3, context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: getHeight(5, context)),
            child: const Text(
              '(+994)   ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            width: getWidth(120, context),
            height: getHeight(53, context),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: state.phoneController,
                maxLength: 9,
                decoration: const InputDecoration(
                  // isDense: true,
                  contentPadding: EdgeInsets.all(0),
                  counter: Offstage(),
                  hintText: 'Telefon nömrəsi',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(144, 152, 177, 1),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}

Container firstphoneChild(BuildContext context, String title) {
  return Container(
    width: getWidth(295, context),
    height: getHeight(53, context),
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(
      horizontal: getWidth(16, context),
    ),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      color: const Color.fromRGBO(255, 255, 255, 1),
      border: Border.all(
        color: const Color.fromRGBO(231, 231, 231, 1),
        width: 1,
      ),
    ),
    child: Text(
      title,
      style: const TextStyle(
          color: Color.fromRGBO(139, 139, 139, 1),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          height: 1),
    ),
  );
}
