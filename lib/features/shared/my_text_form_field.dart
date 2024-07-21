import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextEditingController controller;
  final double? padding;
  final int? maxLines;
  final String?hint;
  final TextStyle?hintStyle;
  final Function(String? value) validator;

  const MyTextFormField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.isObscureText,
    required this.controller,
    this.padding,
    required this.validator, this.maxLines, this.hint, this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Padding(
        padding: EdgeInsets.only(bottom: padding ?? 15.0),
        child: TextFormField(

          validator: (value) {
            return validator(value);
          },
          maxLines: maxLines??1,
          controller: controller,
          obscureText: isObscureText ?? false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: hintStyle,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // تثبيت التسمية

            suffixIcon: suffixIcon,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide( width: 1.5,color: Colors.red)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide( width: 1.5,color: Colors.black)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5)),
          ),
        ),
      ),
    );
  }
}
