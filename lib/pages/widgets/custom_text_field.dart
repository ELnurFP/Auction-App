import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/text_field_validator_provider.dart';
import '../../utils/size.dart';

Container customTextField(BuildContext context, String? title,
    TextEditingController controller, bool isPhone) {
  final validationService = Provider.of<TextFieldValidation>(context);

  return Container(
      height: getHeight(53, context),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: validationService.borderColor(isPhone),
          width: 1,
        ),
      ),
      padding: EdgeInsets.only(
        left: getWidth(15, context),

        // top: getHeight(6, context)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isPhone ? const Text('(+994)   ') : const SizedBox(),
          Flexible(
            child: Center(
              child: TextFormField(
                scrollPadding: const EdgeInsets.all(0),
                keyboardType:
                    isPhone ? TextInputType.number : TextInputType.text,
                controller: controller,
                maxLength: isPhone ? 9 : 7,
                onChanged: (e) {
                  validationService.changeField(controller.text, isPhone);
                },
                textAlignVertical: TextAlignVertical.bottom,
                // textAlignVertical: TextAlignVertical.center,
                // textAlign: TextAlign.left,
                // maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: getHeight(4, context)),
                  isDense: true,
                  errorText: isPhone
                      ? validationService.phone.error
                      : validationService.fin.error,
                  counter: const Offstage(),
                  hintText: title,
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(144, 152, 177, 1),
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
