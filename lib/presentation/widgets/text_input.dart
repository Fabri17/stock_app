import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, this.labelText, this.keyboardType});

  final String? labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        labelStyle: Styles.paragraphOne(color: CustomColors.black500),
        floatingLabelStyle: Styles.paragraphTwo(color: CustomColors.primary),
      ),
      keyboardType: keyboardType,
    );
  }
}
