import 'package:flutter/material.dart';

import '../../../../../main.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextEditingController? controller;
  final double? padding;

  const MyTextFormField({
    super.key, required this.labelText, this.suffixIcon, this.isObscureText, this.controller, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: Padding(
        padding:  EdgeInsets.only(bottom:padding??15.0),
        child: TextFormField(

          controller: controller,
          obscureText: isObscureText??false,
          decoration:  InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always, // تثبيت التسمية

            suffixIcon:suffixIcon ,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 1.5)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 1.5)),
          ),
        ),
      ),
    );
  }
}