import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/login/presentation/view/widgets/text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyTextFormField(
          labelText: 'الإسم الأول ',
        ),
        const MyTextFormField(
          labelText: 'الإسم الأوسط ',
        ),
        const MyTextFormField(
          labelText: 'الإسم الأخير ',
        ),
        const MyTextFormField(
          labelText: 'رقم الجوال ',
        ),
        const MyTextFormField(
          labelText: 'البريد الالكتروني ',
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
          labelText: 'تأكيد كلمة المرور ',
        ),
        const VerticalSpacer(8),

      ],
    );
  }
}
