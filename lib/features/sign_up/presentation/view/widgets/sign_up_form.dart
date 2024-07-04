import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
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
        MyTextFormField(
          labelText: 'الإسم الأول ',
          controller: context.read<AuthCubit>().firstNameController,
        ),
        MyTextFormField(
          labelText: 'الإسم الأوسط ',
          controller: context.read<AuthCubit>().middleNameController,
        ),
        MyTextFormField(
          labelText: 'الإسم الأخير ',
          controller: context.read<AuthCubit>().lastNameController,
        ),
        MyTextFormField(
          labelText: 'رقم الجوال ',
          controller: context.read<AuthCubit>().phoneNumberController,
        ),
        MyTextFormField(
          labelText: 'البريد الالكتروني ',
          controller: context.read<AuthCubit>().emailController,
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
        ),
        const VerticalSpacer(8),
      ],
    );
  }
}
