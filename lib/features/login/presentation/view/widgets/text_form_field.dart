import 'package:flutter/material.dart';

import '../../../../../main.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final bool? isObscureText;

  const MyTextFormField({
    super.key, required this.labelText, this.suffixIcon, this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: TextFormField(
        obscureText: isObscureText??false,
        decoration:  InputDecoration(
          suffixIcon:suffixIcon ,
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}