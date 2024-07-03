import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/login/presentation/view/widgets/text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [ const MyTextFormField(
        labelText: 'رقم الجوال ',
      ),
        const VerticalSpacer(33),
        MyTextFormField(
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          labelText: 'كلمة المرور ',
        ),
        const VerticalSpacer(8),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: (){},
            child: Text(
              'نسيت كلمة المرور',
              style: MyTextStyles.font14Weight600
              ,
            ),
          ),
        ),],

    );
  }
}
