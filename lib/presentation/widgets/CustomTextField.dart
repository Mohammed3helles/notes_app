import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const CustomTextField({super.key, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorManager.textField,
      maxLines: maxLines,
      autocorrect: false,
      enableSuggestions: false,
      style: Theme.of(context).textTheme.bodySmall,

      decoration: InputDecoration(

        hintText: hint,
        hintStyle: const TextStyle(color: ColorManager.textField, fontSize: 18),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(ColorManager.textField),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? ColorManager.white),
        borderRadius: BorderRadius.circular(AppSize.s10));
  }
}
