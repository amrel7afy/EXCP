import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/sign_up/presentation/view/widgets/sing_up_logo_and_upperText.dart';

import 'package:test1/features/sign_up/presentation/view/widgets/sign_up_form.dart';


import 'sign_up_button_and_have_account_text.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignUpLogoAndUpperText(),
              VerticalSpacer(54),
              SignUpForm(),
              VerticalSpacer(12),
              SignUpButtonAndHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
