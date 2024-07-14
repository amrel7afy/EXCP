import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/login/presentation/view/login_view.dart';
import 'package:test1/features/login/presentation/view/widgets/login_button_and_create_account_text.dart';
import 'package:test1/features/login/presentation/view/widgets/login_form.dart';
import 'package:test1/features/login/presentation/view/widgets/login_logo_and_upper_text.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';
import 'package:test1/features/login/presentation/view_model/login_view_model.dart';
import 'package:test1/main.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../core/constants/methods.dart';
import '../../../../core/shared/cubits/auth_cubit/auth_cubit.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginLogoAndUpperText(),
              const VerticalSpacer(54),
              Form(
                key: loginViewModel.loginFormKey,
                child: Column(
                  children: [
                    MyTextFormField(
                        labelText: 'رقم الجوال ',
                        controller: loginViewModel.phoneNumberController,
                        validator: context.read<AuthCubit>().phoneValidator),
                    const VerticalSpacer(18),
                    MyTextFormField(
                      isObscureText: loginViewModel.isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            loginViewModel.isObscureText =
                                !loginViewModel.isObscureText;
                          });
                        },
                        child: Icon(
                          loginViewModel.isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      labelText: 'كلمة المرور ',
                      validator: context.read<AuthCubit>().passwordValidator,
                      controller: loginViewModel.passwordController,
                    ),
                    const VerticalSpacer(8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'نسيت كلمة المرور',
                          style: MyTextStyles.font14Weight600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacer(12),
               CustomButton(
                width: getWidth(context) * 0.5,
                borderRadius: BorderRadius.circular(8),
                text: 'تسجيل الدخول',
                textStyle:
                    MyTextStyles.font18Weight600.copyWith(color: Colors.white),
                backGroundColor: MyColors.kPrimaryColor,
                onPressed: () {
                  if (loginViewModel
                      .loginFormKey
                      .currentState!
                      .validate()) {
                    loginViewModel.userLogin(context);
                  }
                },
              ),
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
                    textDirection: AppConstants.appTextDirection,
                    child: Switch(
                      inactiveThumbColor: MyColors.kPrimaryColor,
                      inactiveTrackColor: const Color(0xffACACAC),
                      activeColor: MyColors.kGreenColor,
                      value: loginViewModel.isSwitched,
                      onChanged: (value) {
                        setState(() {
                          loginViewModel.isSwitched = value;
                        });
                      },
                    ),
                  ),
                  const HorizontalSpacer(7.0),
                  const Text('العربية'),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
