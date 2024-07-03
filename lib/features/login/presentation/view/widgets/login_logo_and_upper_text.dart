import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

class LoginLogoAndUpperText extends StatelessWidget {
  const LoginLogoAndUpperText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        Text(
          'Logo',
          style: MyTextStyles.font40Weight700
              .copyWith(color: Colors.black),
        ),
        const VerticalSpacer(100),
        Text(
          'تسجيل الدخول',
          style: MyTextStyles.font24Weight500
              .copyWith(color: Colors.black),
        ),
        const VerticalSpacer(10),
        Text(
          'يرجى إدخال رقم جوالك المسجل لدينا و كلمة المرور',
          style: MyTextStyles.font12Weight500
              .copyWith(color: Colors.black),
        )
      ],
    );
  }
}
