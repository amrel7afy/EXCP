import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

import 'package:test1/features/sign_up/presentation/view/widgets/sign_up_form.dart';

import 'sign_up_button_and_have_account_text.dart';

class SignUpLogoAndUpperText extends StatelessWidget {
  const SignUpLogoAndUpperText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Logo',
          style: MyTextStyles.font40Weight700.copyWith(color: Colors.black),
        ),
        const VerticalSpacer(30),
        Text(
          'إنشاء حساب جديد',
          style: MyTextStyles.font24Weight500.copyWith(color: Colors.black),
        ),
        Text(
          'يرجى إدخال البيانات التالية',
          style: MyTextStyles.font12Weight500.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
