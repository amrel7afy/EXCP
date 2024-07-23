import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/features/sign_up/presentation/sign_up_view_model.dart';

import '../../../shared/my_text_form_field.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  SignUpViewModel signUpViewModel=SignUpViewModel.instance();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpViewModel.signUpFormKey,
      child: Column(
        children: [
          MyTextFormField(
            labelText: 'الإسم الأول ',
            controller: signUpViewModel.firstNameController, validator: signUpViewModel.firstNameValidator,
          ),
          MyTextFormField(
            labelText: 'الإسم الأوسط ',
            controller: signUpViewModel.middleNameController,
            validator: signUpViewModel.middleNameValidator,

          ),
          MyTextFormField(
            labelText: 'الإسم الأخير ',
            controller: signUpViewModel.lastNameController,
              validator: signUpViewModel.lastNameValidator
          ),
          MyTextFormField(
            labelText: 'رقم الجوال ',
            controller: signUpViewModel.phoneNumberController,
              validator: signUpViewModel.phoneValidator
          ),
          MyTextFormField(
            labelText: 'البريد الالكتروني ',
            controller: signUpViewModel.emailController,
              validator: signUpViewModel.emailValidator
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
            labelText: 'كلمة المرور ',
            controller: signUpViewModel.passwordController,
              validator: signUpViewModel.passwordValidator
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
            controller: signUpViewModel.confirmPasswordController,
              validator: signUpViewModel.confirmPasswordValidator
          ),
          const VerticalSpacer(8),
        ],
      ),
    );
  }
}
