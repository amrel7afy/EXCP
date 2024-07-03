import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/features/login/presentation/view/widgets/login_form.dart';
import 'package:test1/features/login/presentation/view/widgets/text_form_field.dart';

import '../../../../../main.dart';
import 'login_button_and_create_account_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Logo',
                style: MyTextStyles.font40Weight700
                    .copyWith(color: Colors.black),
              ),
              const VerticalSpacer(105),
              Text(
                'تسجيل الدخول',
                style: MyTextStyles.font24Weight500
                    .copyWith(color: Colors.black),
              ),
              Text(
                'يرجى إدخال رقم جوالك المسجل لدينا و كلمة المرور',
                style: MyTextStyles.font12Weight500
                    .copyWith(color: Colors.black),
              ),
              const VerticalSpacer(54),
              const LoginForm(),
              const VerticalSpacer(12),
              const LoginButtonAndCreateAccountText(),
              InkWell(onTap:(){},child: Text('تخطي الان',style: MyTextStyles.font14Weight600,))
            ],
          ),
        ),
      ),
    );
  }
}
