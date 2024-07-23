import 'package:flutter/material.dart';

import '../../../core/constants/vertical_and_horizontal_space.dart';
import 'components/sign_up_button_and_have_account_text.dart';
import 'components/sign_up_form.dart';
import 'components/sing_up_logo_and_upperText.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
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
      ),),
    );
  }
}
