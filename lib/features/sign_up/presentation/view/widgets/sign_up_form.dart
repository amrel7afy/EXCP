import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().signUpFormKey,
      child: Column(
        children: [
          MyTextFormField(
            labelText: 'الإسم الأول ',
            controller: context.read<AuthCubit>().firstNameController, validator: context.read<AuthCubit>().firstNameValidator,
          ),
          MyTextFormField(
            labelText: 'الإسم الأوسط ',
            controller: context.read<AuthCubit>().middleNameController,
            validator: context.read<AuthCubit>().middleNameValidator,

          ),
          MyTextFormField(
            labelText: 'الإسم الأخير ',
            controller: context.read<AuthCubit>().lastNameController,
              validator: context.read<AuthCubit>().lastNameValidator
          ),
          MyTextFormField(
            labelText: 'رقم الجوال ',
            controller: context.read<AuthCubit>().phoneNumberController,
              validator: context.read<AuthCubit>().phoneValidator
          ),
          MyTextFormField(
            labelText: 'البريد الالكتروني ',
            controller: context.read<AuthCubit>().emailController,
              validator: context.read<AuthCubit>().emailValidator
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
            controller: context.read<AuthCubit>().passwordController,
              validator: context.read<AuthCubit>().passwordValidator
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
            controller: context.read<AuthCubit>().confirmPasswordController,
              validator: context.read<AuthCubit>().confirmPasswordValidator
          ),
          const VerticalSpacer(8),
        ],
      ),
    );
  }
}
