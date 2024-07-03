import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/login/presentation/view/widgets/login_form.dart';
import 'package:test1/features/login/presentation/view/widgets/login_logo_and_upper_text.dart';
import 'package:test1/main.dart';
import 'login_button_and_create_account_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscureText = true;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginLogoAndUpperText(),
              const VerticalSpacer(54),
              const LoginForm(),
              const VerticalSpacer(12),
              const LoginButtonAndCreateAccountText(),
              InkWell(
                  onTap: () {},
                  child: Text(
                    'تخطي الان',
                    style: MyTextStyles.font14Weight600,
                  )),
              const VerticalSpacer(35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text('English'),
                  const HorizontalSpacer(7),
                  Directionality(
                    textDirection: appTextDirection,
                    child: Switch(
                      inactiveThumbColor: MyColors.kPrimaryColor,
                      inactiveTrackColor: const Color(0xffACACAC),
                      activeColor: MyColors.kGreenColor,
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    ),
                    
                  ),
                  const HorizontalSpacer(7),
                  const Text('العربية'),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
