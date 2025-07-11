// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import '../theme/app_color.dart';
import '../theme/app_dimens.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.isDense = true,
    this.onTapOutside,
    this.isDigitsOnly,
    this.maxLength,
  });

  final TextEditingController? controller;
  final bool? isDigitsOnly;
  final bool? isDense;
  final Function()? onTapOutside;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) {
        onTapOutside?.call();
        FocusScope.of(context).unfocus();
      },
      style: TextStyle(
        fontSize: AppDimens.fontSizeDefault,
        color: AppColor.getWhiteBlack(context),
      ),
      onEditingComplete: () {
        onTapOutside?.call();
        FocusScope.of(context).unfocus();
      },
      textAlign: TextAlign.left,
      maxLength: maxLength,
      cursorColor: AppColor.getContentColor(context),
      inputFormatters: isDigitsOnly == true
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      keyboardType: isDigitsOnly == true ? TextInputType.number : null,
      decoration: InputDecoration(
        isDense: isDense,
        filled: true,
        counterText: "",
        fillColor: AppColor.getInputFieldColor(context),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
          borderSide: BorderSide(
            color: AppColor.getGreyColorForText(context),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
          borderSide: BorderSide(
            color: AppColor.getTextFieldBorderColor(context),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
