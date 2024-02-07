import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    this.labelText,
    this.keyboardType,
    this.readOnly,
    this.suffixIcon,
    this.controller,
    this.onTap,
  });

  final String? labelText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: CustomColors.black500,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: CustomColors.primary,
            width: 1.0,
          ),
        ),
        labelText: labelText,
        labelStyle: Styles.paragraphOne(),
        floatingLabelStyle: Styles.paragraphTwo(),
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      onTap: () => onTap?.call(),
    );
  }
}
