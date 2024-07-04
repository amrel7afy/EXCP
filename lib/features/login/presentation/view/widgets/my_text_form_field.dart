import 'package:flutter/material.dart';

import '../../../../../main.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextEditingController controller;
  final double? padding;
  final Function(String? value) validator;

  const MyTextFormField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.isObscureText,
    required this.controller,
    this.padding,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: Padding(
        padding: EdgeInsets.only(bottom: padding ?? 15.0),
        child: TextFormField(
          validator: (value) {
            return validator(value);
          },
          controller: controller,
          obscureText: isObscureText ?? false,
          decoration: InputDecoration(
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
